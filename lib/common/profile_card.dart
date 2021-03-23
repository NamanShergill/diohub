import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:onehub/common/profile_banner.dart';
import 'package:onehub/models/users/user_info_model.dart';
import 'package:onehub/routes/router.gr.dart';
import 'package:onehub/style/borderRadiuses.dart';
import 'package:onehub/style/colors.dart';
import 'package:onehub/style/textStyles.dart';

class ProfileCard extends StatelessWidget {
  final UserInfoModel user;
  final bool compact;
  ProfileCard(this.user, {this.compact = false});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 8),
      child: Material(
        elevation: 2,
        color: AppColor.background,
        borderRadius: AppThemeBorderRadius.medBorderRadius,
        child: InkWell(
          borderRadius: AppThemeBorderRadius.medBorderRadius,
          onTap: () {
            AutoRouter.of(context)
                .push(OtherUserProfileScreenRoute(login: user.login));
          },
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProfileTile(
                  user.avatarUrl,
                  showName: true,
                  userLogin: user.login,
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        user.bio != null
                            ? user.bio!.length > 100
                                ? user.bio!.substring(0, 100) + '...'
                                : user.bio!
                            : 'No bio.',
                        style: AppThemeTextStyles.eventCardChildSubtitle,
                      ),
                    ),
                  ],
                ),
                if (!compact)
                  Column(
                    children: [
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            LineIcons.users,
                            size: 12,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            user.followers != null
                                ? user.followers.toString()
                                : 'None',
                            style: AppThemeTextStyles.eventCardChildFooter,
                          ),
                        ],
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}