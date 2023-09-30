import 'package:dio_hub/app/settings/palette.dart';
import 'package:dio_hub/common/search_overlay/filters.dart';
import 'package:dio_hub/common/search_overlay/search_overlay.dart';
import 'package:dio_hub/common/wrappers/search_scroll_wrapper.dart';
import 'package:dio_hub/models/users/user_info_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserRepositories extends StatelessWidget {
  const UserRepositories(
    this.userInfoModel, {
    this.currentUser = false,
    super.key,
  });
  final UserInfoModel userInfoModel;
  final bool? currentUser;

  @override
  Widget build(final BuildContext context) => ColoredBox(
        color: Provider.of<PaletteSettings>(context).currentSetting.secondary,
        child: SearchScrollWrapper(
          SearchData(
            searchFilters: SearchFilters.repositories(
              blacklist: <String>[SearchQueryStrings.user, SearchQueryStrings.org],
            ),
            defaultHiddenFilters: <String>[
              SearchQueries().user.toQueryString(userInfoModel.login!),
            ],
          ),
          quickFilters: <String, String>{
            SearchQueries().iS.toQueryString('public'): 'Public',
            SearchQueries().iS.toQueryString('private'): 'Private',
            SearchQueries().archived.toQueryString('true'): 'Archived',
            SearchQueries().mirror.toQueryString('true'): 'Mirrors',
          },
          quickOptions: <String, String>{
            SearchQueries().fork.toQueryString('true'): 'Include forks',
          },
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          searchBarMessage: "Search in ${userInfoModel.login}'s repositories",
          searchHeroTag: '${userInfoModel.login}Search',
          // nonSearchFuture: (pageNumber, pageSize, refresh, _, sort, order) {
          //   if (currentUser!)
          //     return UserInfoService.getCurrentUserRepos(
          //         pageSize, pageNumber, refresh,
          //         sort: sort, ascending: order);
          //   return UserInfoService.getUserRepos(
          //       userInfoModel.login, pageSize, pageNumber, refresh, sort);
          // },
        ),
      );
}
