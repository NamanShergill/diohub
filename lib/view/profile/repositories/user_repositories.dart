import 'package:flutter/material.dart';
import 'package:onehub/common/search_overlay/filters.dart';
import 'package:onehub/common/search_overlay/search_overlay.dart';
import 'package:onehub/common/search_scroll_wrapper.dart';
import 'package:onehub/models/users/user_info_model.dart';
import 'package:onehub/services/users/user_info_service.dart';
import 'package:onehub/style/colors.dart';

class UserRepositories extends StatefulWidget {
  final UserInfoModel userInfoModel;
  final bool? currentUser;
  UserRepositories(this.userInfoModel, {this.currentUser = false});

  @override
  _UserRepositoriesState createState() => _UserRepositoriesState();
}

class _UserRepositoriesState extends State<UserRepositories> {
  late SearchData searchData;

  @override
  initState() {
    searchData = SearchData(
        searchFilters: SearchFilters.repositories(
            blacklist: [SearchQueryStrings.user, SearchQueryStrings.org]),
        defaultFilters: [
          SearchQueries().user.toQueryString(widget.userInfoModel.login!)
        ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.onBackground,
      child: SearchScrollWrapper(
        searchData,
        searchBarMessage:
            'Search in ${widget.userInfoModel.login}\'s repositories',
        searchHeroTag: '${widget.userInfoModel.login}Search',
        nonSearchFuture: (pageNumber, pageSize, refresh, _) {
          if (widget.currentUser!)
            return UserInfoService.getCurrentUserRepos(
                pageSize, pageNumber, refresh);
          return UserInfoService.getUserRepos(
              widget.userInfoModel.login, pageSize, pageNumber, refresh);
        },
      ),
    );
  }
}
