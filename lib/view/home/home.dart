import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:onehub/common/app_tab_bar.dart';
import 'package:onehub/common/collapsible_app_bar.dart';
import 'package:onehub/common/events/events.dart';
import 'package:onehub/common/login_check_wrapper.dart';
import 'package:onehub/common/provider_loading_progress_wrapper.dart';
import 'package:onehub/common/shimmer_widget.dart';
import 'package:onehub/providers/landing_navigation_provider.dart';
import 'package:onehub/providers/users/current_user_provider.dart';
import 'package:onehub/style/colors.dart';
import 'package:onehub/view/home/widgets/issues_tab.dart';
import 'package:onehub/view/home/widgets/pulls_tab.dart';
import 'package:onehub/view/home/widgets/search_bar.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin, TickerProviderStateMixin {
  @override
  bool get wantKeepAlive => true;
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(vsync: this, initialIndex: 0, length: 4);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return LoginCheckWrapper(
      replacement: HomeScreenUnauthenticated(),
      child: NestedScrollView(
        headerSliverBuilder: (context, _) {
          return [
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverAppBar(
                expandedHeight: 300,
                collapsedHeight: 155,
                pinned: true,
                elevation: 2,
                backgroundColor: AppColor.background,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: CollapsibleAppBar(
                    minHeight: 155,
                    maxHeight: 300,
                    title: 'Home',
                    child: SearchBar(),
                    trailing: ClipOval(
                      child: InkWell(
                        onTap: () {
                          Provider.of<NavigationProvider>(context,
                                  listen: false)
                              .animateToPage(3);
                        },
                        child:
                            ProviderLoadingProgressWrapper<CurrentUserProvider>(
                          childBuilder: (context, value) => CachedNetworkImage(
                            imageUrl: value.currentUserInfo!.avatarUrl!,
                            placeholder: (context, _) {
                              return ShimmerWidget(
                                child: Container(
                                  color: Colors.grey,
                                ),
                              );
                            },
                          ),
                          errorBuilder: (context, error) {
                            return Icon(
                              LineIcons.exclamationCircle,
                              size: 40,
                            );
                          },
                          loadingBuilder: (context) {
                            return ShimmerWidget(
                              child: Container(
                                color: Colors.grey,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(0),
                  child: AppTabBar(
                    controller: _tabController,
                    tabs: [
                      AppTab(
                        title: 'Activity',
                      ),
                      AppTab(
                        title: 'Issues',
                      ),
                      AppTab(
                        title: 'Pull Requests',
                      ),
                      AppTab(
                        title: 'Public Activity',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ];
        },
        body: Container(
          color: AppColor.onBackground,
          child: Padding(
            padding: const EdgeInsets.only(top: 150),
            child: ProviderLoadingProgressWrapper<CurrentUserProvider>(
              childBuilder: (context, value) {
                return Builder(
                  builder: (context) {
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context);
                    return LoginCheckWrapper(
                      child: TabBarView(
                        controller: _tabController,
                        physics: BouncingScrollPhysics(),
                        children: [
                          Events(),
                          IssuesTab(),
                          PullsTab(),
                          Events(
                            privateEvents: false,
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class HomeScreenUnauthenticated extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _media = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          height: _media.height * 0.08,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Home',
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      height: 60,
                      width: 60,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                SearchBar(),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LoginPromptBox(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
