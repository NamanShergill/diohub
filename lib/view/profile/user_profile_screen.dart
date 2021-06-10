import 'package:dio_hub/common/events/events.dart';
import 'package:dio_hub/common/misc/app_scroll_view.dart';
import 'package:dio_hub/common/misc/profile_banner.dart';
import 'package:dio_hub/models/users/user_info_model.dart';
import 'package:dio_hub/style/colors.dart';
import 'package:dio_hub/view/profile/about/about_user.dart';
import 'package:dio_hub/view/profile/overview/user_overview_screen.dart';
import 'package:dio_hub/view/profile/repositories/user_repositories.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class UserProfileScreen<T extends UserInfoModel?> extends StatefulWidget {
  final bool? isCurrentUser;
  final T userData;
  const UserProfileScreen(this.userData, {this.isCurrentUser, Key? key})
      : super(key: key);
  @override
  _UserProfileScreenState<T> createState() => _UserProfileScreenState<T>();
}

class _UserProfileScreenState<T extends UserInfoModel?>
    extends State<UserProfileScreen<T>> with SingleTickerProviderStateMixin {
  TabController? tabController;
  UserInfoModel? data;
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    data = widget.userData;
    tabController = TabController(
        length: data!.type == Type.user ? 4 : 2, vsync: this, initialIndex: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScrollView(
      scrollController: scrollController,
      childrenColor: AppColor.background,
      scrollViewAppBar: ScrollViewAppBar(
        tabController: tabController,
        bottomPadding: 0,
        url: data!.htmlUrl,
        expandedHeight: 250,
        collapsedHeight: 130,
        flexibleBackgroundWidget: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ProfileTile(
                  data!.avatarUrl,
                  size: 50,
                ),
                const SizedBox(
                  width: 16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data!.name ?? data!.login!,
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(fontSize: 18),
                    ),
                    if (data!.name != null)
                      Text(
                        data!.login!,
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                            fontSize: 15, fontWeight: FontWeight.normal),
                      ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(LineIcons.users),
                const SizedBox(
                  width: 8,
                ),
                RichText(
                  text: TextSpan(
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 15),
                    children: [
                      TextSpan(
                          text: data!.followers.toString(),
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      const TextSpan(text: ' followers'),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                RichText(
                  text: TextSpan(
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 15),
                    children: [
                      TextSpan(
                          text: data!.following.toString(),
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      const TextSpan(text: ' following'),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        tabs: [
          'About',
          if (data!.type == Type.user) 'Overview',
          'Repositories',
          if (data!.type == Type.user) 'Activity'
        ],
        appBarWidget: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ProfileTile(data!.avatarUrl),
              const SizedBox(
                width: 8,
              ),
              Flexible(
                  child: Text(
                data!.login!,
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(fontSize: 18),
              )),
            ],
          ),
        ),
      ),
      tabController: tabController,
      tabViews: [
        AboutUser(data),
        if (data!.type == Type.user) UserOverviewScreen(data),
        UserRepositories(
          data!,
          scrollController: scrollController,
          currentUser: widget.isCurrentUser,
        ),
        if (data!.type == Type.user)
          Container(
            color: AppColor.onBackground,
            child: Events(
              specificUser: data!.login,
              scrollController: scrollController,
            ),
          ),
      ],
    );
  }
}
