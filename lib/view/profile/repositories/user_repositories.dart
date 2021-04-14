import 'package:flutter/material.dart';
import 'package:onehub/common/search_overlay/filters.dart';
import 'package:onehub/common/search_overlay/search_overlay.dart';
import 'package:onehub/common/search_scroll_wrapper.dart';
import 'package:onehub/models/users/user_info_model.dart';
import 'package:onehub/services/users/user_info_service.dart';
import 'package:onehub/style/colors.dart';

class UserRepositories extends StatelessWidget {
  final UserInfoModel userInfoModel;
  final bool? currentUser;
  UserRepositories(this.userInfoModel, {this.currentUser = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.onBackground,
      child: SearchScrollWrapper(
        SearchData(
            searchFilters: SearchFilters.repositories(
                blacklist: [SearchQueryStrings.user, SearchQueryStrings.org]),
            defaultHiddenFilters: [
              SearchQueries().user.toQueryString(userInfoModel.login!)
            ]),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        searchBarMessage: 'Search in ${userInfoModel.login}\'s repositories',
        searchHeroTag: '${userInfoModel.login}Search',
        nonSearchFuture: (pageNumber, pageSize, refresh, _, sort, order) {
          if (currentUser!)
            return UserInfoService.getCurrentUserRepos(
                pageSize, pageNumber, refresh,
                sort: sort, ascending: order);
          return UserInfoService.getUserRepos(
              userInfoModel.login, pageSize, pageNumber, refresh, sort);
        },
      ),
    );
  }
}
