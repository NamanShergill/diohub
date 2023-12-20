import 'package:cached_network_image/cached_network_image.dart';
import 'package:diohub/adapters/deep_linking_handler.dart';
import 'package:diohub/common/misc/info_card.dart';
import 'package:diohub/common/misc/ink_pot.dart';
import 'package:diohub/common/misc/profile_banner.dart';
import 'package:diohub/common/misc/scroll_scaffold.dart';
import 'package:diohub/common/misc/shimmer_widget.dart';
import 'package:diohub/common/wrappers/infinite_scroll_wrapper.dart';
import 'package:diohub/common/wrappers/provider_loading_progress_wrapper.dart';
import 'package:diohub/graphql/queries/viewer/__generated__/viewer.query.data.gql.dart';
import 'package:diohub/providers/base_provider.dart';
import 'package:diohub/providers/users/current_user_provider.dart';
import 'package:diohub/services/users/user_info_service.dart';
import 'package:diohub/utils/utils.dart';
import 'package:diohub/view/home/widgets/issues_tab.dart';
import 'package:diohub/view/home/widgets/pulls_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';

import '../../common/events/events.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    required this.tabNavigators, // required this.parentTabController,
    super.key,
    this.deepLinkData,
    this.buildThemePZero,
  });

  final dynamic buildThemePZero;
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
    _tabController = TabController(vsync: this, length: 5, initialIndex: 0);
    if (widget.deepLinkData?.components.first == 'issues') {
      _tabController.index = 1;
    } else if (widget.deepLinkData?.components.first == 'pulls') {
      _tabController.index = 2;
    }
    super.initState();
  }

  @override
  Widget build(final BuildContext context) {
    super.build(context);
    return ScrollScaffold(
      appBar: AppBar(
        title: switch (context.providerStatus<CurrentUserProvider>()) {
          Status.loaded => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ClipOval(
                  child: InkPot(
                    onTap: () {
                      widget.tabNavigators.toProfile();
                    },
                    child: ProviderLoadingProgressWrapper<CurrentUserProvider>(
                      childBuilder: (
                        final BuildContext context,
                        final CurrentUserProvider value,
                      ) =>
                          // widget.buildThemePZero.call(
                          //     imageUrl: value.data.avatarUrl,
                          //     child:
                          CachedNetworkImage(
                        height: 32,
                        imageUrl: value.data.avatarUrl!,
                        placeholder: (final BuildContext context, final _) =>
                            ShimmerWidget(
                          child: Container(
                            color: context.colorScheme.surface,
                          ),
                        ),
                        // )
                      ),
                      errorBuilder:
                          (final BuildContext context, final Object error) =>
                              const Icon(
                        MdiIcons.exclamation,
                        size: 25,
                      ),
                      loadingBuilder: (final BuildContext context) =>
                          const ShimmerWidget(),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  context.provider<CurrentUserProvider>().data.login!,
                  style: context.textTheme.bodyLarge?.asBold(),
                ),
              ],
            ),
          _ => null,
        },
      ),
      subHeader: TabBar(
        isScrollable: true,
        controller: _tabController,
        tabs: const <String>[
          'Feed',
          'Issues',
          'Pull Requests',
          'Organizations',
          'Public Activity',
        ]
            .map(
              (final String e) => Tab(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(e),
                ),
              ),
            )
            .toList(),
      ),
      header: Padding(
        padding: const EdgeInsets.all(8.0),
        child: WrappedCollection(
          children: <Widget>[],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        physics: const BouncingScrollPhysics(),
        children: <Widget>[
          const Events(
            isTimeline: false,
          ),
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
          InfiniteScrollWrapper<GgetViewerOrgsData_viewer_organizations_edges?>(
            future: (
              final ScrollWrapperFutureArguments<
                      GgetViewerOrgsData_viewer_organizations_edges?>
                  data,
            ) async =>
                UserInfoService.getViewerOrgs(
              refresh: data.refresh,
              after: data.lastItem?.cursor,
            ),
            separatorBuilder: (final BuildContext context, final int index) =>
                const Divider(
              height: 8,
            ),
            listEndIndicator: false,
            // divider: false,
            builder: (
              final BuildContext context,
              final ScrollWrapperBuilderData<
                      GgetViewerOrgsData_viewer_organizations_edges?>
                  data,
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
            isTimeline: false,
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
    //             child: InkPot(
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
    //                       color: grey,
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
    //                     color: grey,
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
//                           color: white, fontWeight: FontWeight.bold),
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
