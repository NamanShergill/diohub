import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:onehub/common/bottom_sheet.dart';
import 'package:onehub/common/info_card.dart';
import 'package:onehub/models/users/user_info_model.dart';
import 'package:onehub/style/colors.dart';
import 'package:onehub/utils/get_date.dart';

class AboutUser extends StatelessWidget {
  final UserInfoModel userInfoModel;
  AboutUser(this.userInfoModel);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Column(
        children: [
          SizedBox(
            height: 16,
          ),
          if (userInfoModel.bio != null)
            InfoCard(
              'Bio',
              child: Row(
                children: [
                  Text(userInfoModel.bio),
                ],
              ),
            ),
          if (userInfoModel.twitterUsername != null)
            InfoCard(
              'Twitter',
              onTap: () {
                showURLBottomActionsMenu(context,
                    'https://twitter.com/${userInfoModel.twitterUsername}');
              },
              child: Row(
                children: [
                  Icon(
                    LineIcons.twitter,
                    color: AppColor.grey3,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text('@${userInfoModel.twitterUsername}'),
                ],
              ),
            ),
          if (userInfoModel.email != null)
            InfoCard(
              'Email',
              child: Row(
                children: [
                  Icon(
                    LineIcons.at,
                    color: AppColor.grey3,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(userInfoModel.email),
                ],
              ),
            ),
          if (userInfoModel.blog != null && userInfoModel.blog.isNotEmpty)
            InfoCard(
              'Blog',
              onTap: () {
                showURLBottomActionsMenu(context, userInfoModel.blog);
              },
              child: Row(
                children: [
                  Icon(
                    LineIcons.blog,
                    color: AppColor.grey3,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Flexible(child: Text('${userInfoModel.blog}')),
                ],
              ),
            ),
          if (userInfoModel.company != null)
            InfoCard(
              'Company',
              child: Row(
                children: [
                  Icon(
                    LineIcons.building,
                    color: AppColor.grey3,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(userInfoModel.company),
                ],
              ),
            ),
          if (userInfoModel.location != null)
            InfoCard(
              'Location',
              child: Row(
                children: [
                  Icon(
                    LineIcons.locationArrow,
                    color: AppColor.grey3,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(userInfoModel.location),
                ],
              ),
            ),
          if (userInfoModel.createdAt != null)
            InfoCard(
              'Joined',
              child: Row(
                children: [
                  Icon(
                    LineIcons.calendar,
                    color: AppColor.grey3,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(getDate(userInfoModel.createdAt.toString(),
                      shorten: false)),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
