import 'package:diohub/common/events/events.dart';
import 'package:diohub/common/misc/app_scroll_view.dart';
import 'package:diohub/common/misc/profile_banner.dart';
import 'package:diohub/common/misc/theme_from_image.dart';
import 'package:diohub/models/users/user_info_model.dart';
import 'package:diohub/providers/users/current_user_provider.dart';
import 'package:diohub/utils/utils.dart';
import 'package:diohub/view/profile/about/about_user.dart';
import 'package:diohub/view/profile/overview/user_overview_screen.dart';
import 'package:diohub/view/profile/repositories/user_repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:provider/provider.dart';

class UserProfileScreen<T extends UserInfoModel> extends StatefulWidget {
  const UserProfileScreen(this.userData, {this.isCurrentUser, super.key});

  final bool? isCurrentUser;
  final T userData;

  @override
  UserProfileScreenState<T> createState() => UserProfileScreenState<T>();
}

class UserProfileScreenState<T extends UserInfoModel>
    extends State<UserProfileScreen<T>> with SingleTickerProviderStateMixin {
  late TabController tabController;
  late UserInfoModel data;

  @override
  void initState() {
    data = widget.userData;
    tabController = TabController(
      length: data.type == Type.user ? 4 : 2,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(final BuildContext context) => ThemeFromImage(
        // imageUri: widget.userData.avatarUrl,
        builder: (final BuildContext context) => AppScrollView(
          // childrenColor:
          //     Provider.of<PaletteSettings>(context).currentSetting.primary,
          scrollViewAppBar: ScrollViewAppBar(
            tabController: tabController,
            bottomPadding: 0,
            url: data.htmlUrl,
            expandedHeight: 250,
            collapsedHeight: 130,
            flexibleBackgroundWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    ThemePZero(
                      imageUrl: data.avatarUrl ?? '',
                      child: ProfileTile.avatar(
                        avatarUrl: data.avatarUrl,
                        size: 50,
                      ),
                    ),
                    // ThemeSwitcher(
                    //   builder: (p0) => GestureDetector(
                    //     onTap: () {
                    //       // ThemeSwitcher.of(p0).changeTheme(theme: theme);
                    //     },
                    //     child: ProfileTile.avatar(
                    //       avatarUrl: data.avatarUrl,
                    //       size: 50,
                    //     ),
                    //   ),
                    // ),
                    const SizedBox(
                      width: 16,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          data.name ?? data.login!,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        if (data.name != null)
                          Text(
                            data.login!,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: <Widget>[
                    if (data.login ==
                        Provider.of<CurrentUserProvider>(context).data.login)
                      Row(
                        children: <Widget>[
                          const Icon(MdiIcons.accountGroup),
                          const SizedBox(
                            width: 8,
                          ),
                          Text.rich(
                            TextSpan(
                              children: <InlineSpan>[
                                TextSpan(
                                  text: data.followers.toString(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const TextSpan(text: ' followers'),
                              ],
                            ),
                          ),
                        ],
                      )
                    else if (data.type == Type.user)
                      // UserFollow(
                      //   data.login!,
                      //   fadeIntoView: false,
                      //   inkWellRadius: medBorderRadius,
                      //   child: (
                      //     final BuildContext context,
                      //     final FollowStatusInfo$Query$User? followingData,
                      //     final VoidCallback? onPress,
                      //   ) =>
                      //       ActionButton(
                      //     action: 'Followers',
                      //     count: followingData?.followers.totalCount,
                      //     isDone: followingData?.viewerIsFollowing,
                      //     onTap: onPress,
                      //     doneColor: context.palette.accent,
                      //     icon: followingData?.viewerIsFollowing ?? false
                      //         ? Icons.check
                      //         : Icons.add,
                      //   ),
                      // ),
                      const SizedBox(
                        width: 16,
                      ),
                    if (data.type == Type.user)
                      Text.rich(
                        TextSpan(
                          children: <InlineSpan>[
                            TextSpan(
                              text: data.following.toString(),
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const TextSpan(text: ' following'),
                          ],
                        ),
                      ),
                  ],
                ),
              ],
            ),
            tabs: <String>[
              'About',
              if (data.type == Type.user) 'Overview',
              'Repositories',
              if (data.type == Type.user) 'Activity',
            ],
            appBarWidget: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: <Widget>[
                  ProfileTile.avatar(
                    avatarUrl: data.avatarUrl,
                    padding: EdgeInsets.zero,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Flexible(
                    child: Text(
                      data.login!,
                      style: context.textTheme.headlineSmall,
                    ),
                  ),
                ],
              ),
            ),
          ),
          tabController: tabController,
          tabViews: <Widget>[
            AboutUser(data),
            if (data.type == Type.user) UserOverviewScreen(data),
            UserRepositories(
              data,
              currentUser: widget.isCurrentUser,
            ),
            if (data.type == Type.user)
              Events(
                specificUser: data.login,
              ),
          ],
        ),
      );
}
