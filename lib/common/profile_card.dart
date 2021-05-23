import 'package:auto_route/auto_route.dart';
import 'package:dio_hub/common/profile_banner.dart';
import 'package:dio_hub/models/users/user_info_model.dart';
import 'package:dio_hub/routes/router.gr.dart';
import 'package:dio_hub/style/border_radiuses.dart';
import 'package:dio_hub/style/colors.dart';
import 'package:dio_hub/style/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class ProfileCard extends StatelessWidget {
  final UserInfoModel user;
  final bool compact;
  final EdgeInsets padding;
  const ProfileCard(this.user,
      {this.compact = false,
      this.padding = const EdgeInsets.symmetric(horizontal: 0.0, vertical: 8),
      Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
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
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProfileTile(
                  user.avatarUrl,
                  fullName: user.name,
                  showName: true,
                  userLogin: user.login,
                ),
                const SizedBox(
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
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            LineIcons.users,
                            size: 12,
                          ),
                          const SizedBox(
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
