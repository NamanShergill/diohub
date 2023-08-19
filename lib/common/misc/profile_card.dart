import 'package:auto_route/auto_route.dart';
import 'package:dio_hub/app/settings/palette.dart';
import 'package:dio_hub/common/animations/size_expanded_widget.dart';
import 'package:dio_hub/common/misc/loading_indicator.dart';
import 'package:dio_hub/common/misc/profile_banner.dart';
import 'package:dio_hub/common/misc/user_follow.dart';
import 'package:dio_hub/common/wrappers/api_wrapper_widget.dart';
import 'package:dio_hub/models/users/user_info_model.dart';
import 'package:dio_hub/providers/users/current_user_provider.dart';
import 'package:dio_hub/routes/router.gr.dart';
import 'package:dio_hub/services/users/user_info_service.dart';
import 'package:dio_hub/style/border_radiuses.dart';
import 'package:dio_hub/style/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard(this.user,
      {this.compact = false,
      this.isThemed = true,
      this.padding = EdgeInsets.zero,
      Key? key})
      : super(key: key);
  final UserInfoModel user;
  final bool compact;
  final EdgeInsets padding;
  final bool isThemed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: isThemed ? padding : EdgeInsets.zero,
      child: Material(
        elevation: isThemed ? 2 : 0,
        color: isThemed
            ? Provider.of<PaletteSettings>(context).currentSetting.primary
            : Colors.transparent,
        borderRadius: medBorderRadius,
        child: InkWell(
          borderRadius: medBorderRadius,
          onTap: () {
            AutoRouter.of(context)
                .push(OtherUserProfileRoute(login: user.login!));
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IgnorePointer(
                      child: ProfileTile.extended(
                        avatarUrl: user.avatarUrl,
                        fullName: user.name,
                        size: 30,
                        userLogin: user.login,
                      ),
                    ),
                    if (user.bio != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Flexible(
                          child: Row(
                            children: [
                              Flexible(
                                child: Text(
                                  user.bio!,
                                  overflow: TextOverflow.ellipsis,
                                  style:
                                      AppThemeTextStyles.eventCardChildSubtitle(
                                          context),
                                ),
                              ),
                            ],
                          ),
                        ),
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
                                style: AppThemeTextStyles.eventCardChildFooter(
                                    context),
                              ),
                            ],
                          ),
                        ],
                      ),
                  ],
                ),
                if (user.login !=
                    Provider.of<CurrentUserProvider>(context).data.login)
                  UserFollow(user.login!),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileCardLoading extends StatelessWidget {
  const ProfileCardLoading(
    this.login, {
    Key? key,
    this.compact = false,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);
  final String login;
  final bool compact;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Material(
        elevation: 2,
        color: Provider.of<PaletteSettings>(context).currentSetting.primary,
        borderRadius: medBorderRadius,
        child: APIWrapper<UserInfoModel>(
          apiCall: ({required refresh}) => UserInfoService.getUserInfo(login),
          responseBuilder: (context, data) {
            return SizeExpandedSection(
                child: Row(
              children: [
                Expanded(
                  child: ProfileCard(
                    data,
                    isThemed: false,
                    compact: compact,
                    padding: padding,
                  ),
                ),
              ],
            ));
          },
          loadingBuilder: (context) {
            return const Padding(
              padding: EdgeInsets.all(16.0),
              child: LoadingIndicator(),
            );
          },
        ),
      ),
    );
  }
}
