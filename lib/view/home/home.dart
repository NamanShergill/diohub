import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio_hub/app/settings/palette.dart';
import 'package:dio_hub/common/events/events.dart';
import 'package:dio_hub/common/misc/app_tab_bar.dart';
import 'package:dio_hub/common/misc/collapsible_app_bar.dart';
import 'package:dio_hub/common/misc/profile_banner.dart';
import 'package:dio_hub/common/misc/shimmer_widget.dart';
import 'package:dio_hub/common/search_overlay/search_bar.dart';
import 'package:dio_hub/common/wrappers/infinite_scroll_wrapper.dart';
import 'package:dio_hub/common/wrappers/provider_loading_progress_wrapper.dart';
import 'package:dio_hub/controller/deep_linking_handler.dart';
import 'package:dio_hub/graphql/graphql.dart';
import 'package:dio_hub/providers/landing_navigation_provider.dart';
import 'package:dio_hub/providers/search_data_provider.dart';
import 'package:dio_hub/providers/users/current_user_provider.dart';
import 'package:dio_hub/services/users/user_info_service.dart';
import 'package:dio_hub/view/home/widgets/issues_tab.dart';
import 'package:dio_hub/view/home/widgets/pulls_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, this.deepLinkData}) : super(key: key);
  final DeepLinkData? deepLinkData;
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin, TickerProviderStateMixin {
  @override
  bool get wantKeepAlive => true;
  late TabController _tabController;
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    _tabController = TabController(vsync: this, initialIndex: 0, length: 5);
    if (widget.deepLinkData?.components.first == 'issues') {
      _tabController.index = 1;
    } else if (widget.deepLinkData?.components.first == 'pulls') {
      _tabController.index = 2;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _search = Provider.of<SearchDataProvider>(context);

    super.build(context);
    return NestedScrollView(
      controller: scrollController,
      headerSliverBuilder: (context, _) {
        return [
          SliverOverlapAbsorber(
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            sliver: SliverSafeArea(
              sliver: SliverAppBar(
                expandedHeight: 300,
                collapsedHeight: 155,
                pinned: true,
                elevation: 2,
                backgroundColor: Provider.of<PaletteSettings>(context)
                    .currentSetting
                    .primary,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: CollapsibleAppBar(
                    minHeight: 155,
                    maxHeight: 300,
                    title: 'Home',
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
                            imageUrl: value.data.avatarUrl!,
                            placeholder: (context, _) {
                              return ShimmerWidget(
                                child: Container(
                                  color: Colors.grey,
                                ),
                              );
                            },
                          ),
                          errorBuilder: (context, error) {
                            return const Icon(
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
                    child: SearchBar(
                      updateBarOnChange: false,
                      onSubmit: (data) {
                        _search.updateSearchData(data);
                        Provider.of<NavigationProvider>(context, listen: false)
                            .animateToPage(1);
                      },
                      heroTag: 'homeSearchBar',
                    ),
                  ),
                ),
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(0),
                  child: Container(
                    color: Provider.of<PaletteSettings>(context)
                        .currentSetting
                        .primary,
                    child: AppTabBar(
                      controller: _tabController,
                      tabs: const [
                        'Activity',
                        'Issues',
                        'Pull Requests',
                        'Organizations',
                        'Public Activity',
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ];
      },
      body: Container(
        color: Provider.of<PaletteSettings>(context).currentSetting.secondary,
        child: ProviderLoadingProgressWrapper<CurrentUserProvider>(
          childBuilder: (context, value) {
            return Builder(
              builder: (context) {
                NestedScrollView.sliverOverlapAbsorberHandleFor(context);
                return TabBarView(
                  controller: _tabController,
                  physics: const BouncingScrollPhysics(),
                  children: [
                    Events(
                      scrollController: scrollController,
                    ),
                    IssuesTab(
                      scrollController: scrollController,
                      deepLinkData:
                          widget.deepLinkData?.components.first == 'issues'
                              ? widget.deepLinkData
                              : null,
                    ),
                    PullsTab(
                      scrollController: scrollController,
                      deepLinkData:
                          widget.deepLinkData?.components.first == 'pulls'
                              ? widget.deepLinkData
                              : null,
                    ),
                    InfiniteScrollWrapper<
                        GetViewerOrgs$Query$Viewer$Organizations$Edges?>(
                      future: (pageNumber, pageSize, refresh, lastItem) {
                        return UserInfoService.getViewerOrgs(
                            refresh: refresh, after: lastItem?.cursor);
                      },
                      firstDivider: false,
                      topSpacing: 8,
                      listEndIndicator: false,
                      // divider: false,
                      builder: (context, item, index, refresh) {
                        return Row(
                          children: [
                            Expanded(
                              child: ProfileTile(
                                item!.node?.avatarUrl.toString(),
                                userLogin: item.node?.login,
                                showName: true,
                                padding: const EdgeInsets.all(16),
                                size: 30,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    Events(
                      privateEvents: false,
                      scrollController: scrollController,
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
//
// class HomeScreenUnauthenticated extends StatelessWidget {
//   const HomeScreenUnauthenticated({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     final _search = Provider.of<SearchDataProvider>(context);
//
//     final _media = MediaQuery.of(context).size;
//     return Column(
//       children: [
//         SizedBox(
//           height: _media.height * 0.08,
//         ),
//         Expanded(
//           child: Padding(
//             padding: const EdgeInsets.all(32.0),
//             child: Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       'Home',
//                       style: Theme.of(context).textTheme.headline4!.copyWith(
//                           color: Colors.white, fontWeight: FontWeight.bold),
//                     ),
//                     const SizedBox(
//                       height: 60,
//                       width: 60,
//                     ),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 SearchBar(
//                   updateBarOnChange: false,
//                   onSubmit: (data) {
//                     _search.updateSearchData(data);
//
//                     Provider.of<NavigationProvider>(context, listen: false)
//                         .animateToPage(1);
//                   },
//                 ),
//                 Expanded(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: const [
//                       LoginPromptBox(),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
