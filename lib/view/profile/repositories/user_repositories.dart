import 'package:flutter/material.dart';
import 'package:onehub/common/infinite_scroll_wrapper.dart';
import 'package:onehub/common/repository_card.dart';
import 'package:onehub/models/repositories/repository_model.dart';
import 'package:onehub/models/users/user_info_model.dart';
import 'package:onehub/services/users/user_info_service.dart';
import 'package:onehub/style/colors.dart';

class UserRepositories extends StatelessWidget {
  final UserInfoModel? userInfoModel;
  final bool? currentUser;
  UserRepositories(this.userInfoModel, {this.currentUser = false});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.onBackground,
      child: InfiniteScrollWrapper<RepositoryModel>(
        future: (pageNumber, pageSize, refresh, _) {
          if (currentUser!)
            return UserInfoService.getCurrentUserRepos(
                pageSize, pageNumber, refresh);
          return UserInfoService.getUserRepos(
              userInfoModel!.login, pageSize, pageNumber, refresh);
        },
        divider: false,
        spacing: 4,
        topSpacing: 8,
        builder: (context, item, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: RepositoryCard(item),
          );
        },
      ),
    );
  }
}
