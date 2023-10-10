import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio_hub/common/events/events.dart';
import 'package:dio_hub/common/misc/profile_banner.dart';
import 'package:dio_hub/common/misc/scroll_scaffold.dart';
import 'package:dio_hub/common/misc/shimmer_widget.dart';
import 'package:dio_hub/common/wrappers/infinite_scroll_wrapper.dart';
import 'package:dio_hub/common/wrappers/provider_loading_progress_wrapper.dart';
import 'package:dio_hub/controller/deep_linking_handler.dart';
import 'package:dio_hub/graphql/graphql.graphql.dart';
import 'package:dio_hub/providers/base_provider.dart';
import 'package:dio_hub/providers/search_data_provider.dart';
import 'package:dio_hub/providers/users/current_user_provider.dart';
import 'package:dio_hub/services/users/user_info_service.dart';
import 'package:dio_hub/view/home/widgets/issues_tab.dart';
import 'package:dio_hub/view/home/widgets/pulls_tab.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    required this.tabNavigators, // required this.parentTabController,
    super.key,
    this.deepLinkData,
  });
  final PathData? deepLinkData;
  final ({VoidCallback toSearch, VoidCallback toProfile}) tabNavigators;
  // final TabController parentTabController;
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin, TickerProviderStateMixin {
  @override
  bool get wantKeepAlive => true;
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 5);
    if (widget.deepLinkData?.components.first == 'issues') {
      _tabController.index = 1;
    } else if (widget.deepLinkData?.components.first == 'pulls') {
      _tabController.index = 2;
    }
    super.initState();
  }

  @override
  Widget build(final BuildContext context) {
    final SearchDataProvider search = Provider.of<SearchDataProvider>(context);

    super.build(context);
    return ScrollScaffold(
      appBar: AppBar(
          title: switch (context.providerStatus<CurrentUserProvider>()) {
            Status.loaded => Text(
                context.provider<CurrentUserProvider>().data.login!,
              ),
            _ => null,
          },
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: switch (context.providerStatus<CurrentUserProvider>()) {
                Status.loaded => ClipOval(
                    child: InkWell(
                      onTap: () {
                        widget.tabNavigators.toProfile();
                      },
                      child:
                          ProviderLoadingProgressWrapper<CurrentUserProvider>(
                        childBuilder: (
                          final BuildContext context,
                          final CurrentUserProvider value,
                        ) =>
                            CachedNetworkImage(
                          height: 36,
                          imageUrl: value.data.avatarUrl!,
                          placeholder: (final BuildContext context, final _) =>
                              ShimmerWidget(
                            child: Container(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        errorBuilder:
                            (final BuildContext context, final Object error) =>
                                const Icon(
                          LineIcons.exclamationCircle,
                          size: 40,
                        ),
                        loadingBuilder: (final BuildContext context) =>
                            ShimmerWidget(
                          child: Container(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                _ => Container(),
              },
            )
          ]),
      subHeader: TabBar(
        isScrollable: true,
        controller: _tabController,
        tabs: const <String>[
          'Activity',
          'Issues',
          'Pull Requests',
          'Organizations',
          'Public Activity',
        ]
            .map(
              (e) => Tab(
                text: e,
              ),
            )
            .toList(),
      ),
      header: Container(
        height: 100,
      ),
      body: TabBarView(
        controller: _tabController,
        physics: const BouncingScrollPhysics(),
        children: <Widget>[
          const Events(),
          IssuesTab(
            deepLinkData: widget.deepLinkData?.components.first == 'issues'
                ? widget.deepLinkData
                : null,
          ),
          PullsTab(
            deepLinkData: widget.deepLinkData?.components.first == 'pulls'
                ? widget.deepLinkData
                : null,
          ),
          InfiniteScrollWrapper<
              GetViewerOrgs$Query$Viewer$Organizations$Edges?>(
            future: (
              final ({
                GetViewerOrgs$Query$Viewer$Organizations$Edges? lastItem,
                int pageNumber,
                int pageSize,
                bool refresh
              }) data,
            ) async =>
                UserInfoService.getViewerOrgs(
              refresh: data.refresh,
              after: data.lastItem?.cursor,
            ),
            separatorBuilder: (final BuildContext context, final int index) =>
                const Divider(
              height: 8,
            ),
            topSpacing: 8,
            listEndIndicator: false,
            // divider: false,
            builder: (
              final BuildContext context,
              final ({
                int index,
                GetViewerOrgs$Query$Viewer$Organizations$Edges? item,
                bool refresh
              }) data,
            ) =>
                Row(
              children: <Widget>[
                Expanded(
                  child: ProfileTile.login(
                    avatarUrl: data.item?.node?.avatarUrl.toString(),
                    userLogin: data.item?.node?.login,
                    padding: const EdgeInsets.all(16),
                    size: 30,
                  ),
                ),
              ],
            ),
          ),
          const Events(
            privateEvents: false,
          ),
        ],
      ),
    );
    // return NestedScroll(
    //   header: (
    //     final BuildContext context, {
    //     required final bool isInnerBoxScrolled,
    //   }) =>
    //       <Widget>[
    //     SliverAppBar(
    //       expandedHeight: 300,
    //       collapsedHeight: 100,
    //       pinned: true,
    //       // backgroundColor:
    //       //     c,
    //       flexibleSpace: Padding(
    //         padding: const EdgeInsets.only(bottom: 30),
    //         child: CollapsibleAppBar(
    //           minHeight: 100,
    //           maxHeight: 300,
    //           title: 'Home',
    //           trailing: ClipOval(
    //             child: InkWell(
    //               onTap: () {
    //                 widget.tabNavigators.toProfile();
    //               },
    //               child: ProviderLoadingProgressWrapper<CurrentUserProvider>(
    //                 childBuilder: (
    //                   final BuildContext context,
    //                   final CurrentUserProvider value,
    //                 ) =>
    //                     CachedNetworkImage(
    //                   imageUrl: value.data.avatarUrl!,
    //                   placeholder: (final BuildContext context, final _) =>
    //                       ShimmerWidget(
    //                     child: Container(
    //                       color: Colors.grey,
    //                     ),
    //                   ),
    //                 ),
    //                 errorBuilder:
    //                     (final BuildContext context, final Object error) =>
    //                         const Icon(
    //                   LineIcons.exclamationCircle,
    //                   size: 40,
    //                 ),
    //                 loadingBuilder: (final BuildContext context) =>
    //                     ShimmerWidget(
    //                   child: Container(
    //                     color: Colors.grey,
    //                   ),
    //                 ),
    //               ),
    //             ),
    //           ),
    //           child: AppSearchBar(
    //             updateBarOnChange: false,
    //             onSubmit: (final SearchData data) {
    //               search.updateSearchData(data);
    //               widget.tabNavigators.toSearch();
    //             },
    //             heroTag: 'homeSearchBar',
    //           ),
    //         ),
    //       ),
    //       bottom: TabBar(
    //         isScrollable: true,
    //         controller: _tabController,
    //         tabs: const <String>[
    //           'Activity',
    //           'Issues',
    //           'Pull Requests',
    //           'Organizations',
    //           'Public Activity',
    //         ]
    //             .map(
    //               (e) => Tab(
    //                 text: e,
    //               ),
    //             )
    //             .toList(),
    //       ),
    //     ),
    //   ],
    //   body: TabBarView(
    //     controller: _tabController,
    //     physics: const BouncingScrollPhysics(),
    //     children: <Widget>[
    //       const Events(),
    //       IssuesTab(
    //         deepLinkData: widget.deepLinkData?.components.first == 'issues'
    //             ? widget.deepLinkData
    //             : null,
    //       ),
    //       PullsTab(
    //         deepLinkData: widget.deepLinkData?.components.first == 'pulls'
    //             ? widget.deepLinkData
    //             : null,
    //       ),
    //       InfiniteScrollWrapper<
    //           GetViewerOrgs$Query$Viewer$Organizations$Edges?>(
    //         future: (
    //           final ({
    //             GetViewerOrgs$Query$Viewer$Organizations$Edges? lastItem,
    //             int pageNumber,
    //             int pageSize,
    //             bool refresh
    //           }) data,
    //         ) async =>
    //             UserInfoService.getViewerOrgs(
    //           refresh: data.refresh,
    //           after: data.lastItem?.cursor,
    //         ),
    //         separatorBuilder: (final BuildContext context, final int index) =>
    //             const Divider(
    //           height: 8,
    //         ),
    //         topSpacing: 8,
    //         listEndIndicator: false,
    //         // divider: false,
    //         builder: (
    //           final BuildContext context,
    //           final ({
    //             int index,
    //             GetViewerOrgs$Query$Viewer$Organizations$Edges? item,
    //             bool refresh
    //           }) data,
    //         ) =>
    //             Row(
    //           children: <Widget>[
    //             Expanded(
    //               child: ProfileTile.login(
    //                 avatarUrl: data.item?.node?.avatarUrl.toString(),
    //                 userLogin: data.item?.node?.login,
    //                 padding: const EdgeInsets.all(16),
    //                 size: 30,
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //       const Events(
    //         privateEvents: false,
    //       ),
    //     ],
    //   ),
    // );
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
//                       style: Theme.of(context).textTheme.headlineMedium!.copyWith(
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
