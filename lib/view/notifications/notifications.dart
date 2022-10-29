import 'package:dio_hub/app/settings/palette.dart';
import 'package:dio_hub/common/animations/size_expanded_widget.dart';
import 'package:dio_hub/common/bottom_sheet/bottom_sheets.dart';
import 'package:dio_hub/common/misc/button.dart';
import 'package:dio_hub/common/misc/collapsible_app_bar.dart';
import 'package:dio_hub/common/misc/nested_scroll.dart';
import 'package:dio_hub/common/wrappers/infinite_scroll_wrapper.dart';
import 'package:dio_hub/models/events/notifications_model.dart';
import 'package:dio_hub/services/activity/notifications_service.dart';
import 'package:dio_hub/view/notifications/widgets/filter_sheet.dart';
import 'package:dio_hub/view/notifications/widgets/notification_cards/issue_notification_card.dart';
import 'package:dio_hub/view/notifications/widgets/notification_cards/pull_request_notification_card.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);
  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen>
    with AutomaticKeepAliveClientMixin {
  /// Filters to be supplied to the API.
  Map<String, dynamic> apiFilters = {'all': true};

  /// Filters to be applied client side.
  Map<String, dynamic> clientFilters = {'show_only': []};

  /// Is the action button pane expanded.
  bool expanded = false;

  /// Controller for the infinite pagination wrapper.
  final InfiniteScrollWrapperController _controller =
      InfiniteScrollWrapperController();

  /// 'Mark all as read" button status.
  bool loadingButton = false;

  /// Function to check if a specific notification fits the user filter or not.
  bool? checkFilter(NotificationModel notification) {
    bool? allowed = true;
    if (clientFilters['show_only'].isNotEmpty) {
      allowed = clientFilters['show_only'].contains(notification.reason);
    }
    return allowed;
  }

  /// Show bottom sheet to apply filters.
  void showFilterSheet() {
    showScrollableBottomSheet(
      context,
      scrollableBodyBuilder: (context, setState, scrollController) =>
          FilterSheet(
        apiFilters: apiFilters,
        controller: scrollController,
        clientFilters: clientFilters,
        onFiltersChanged: (updatedAPIFilters, updatedClientFilters) {
          apiFilters = updatedAPIFilters as Map<String, dynamic>;
          clientFilters = updatedClientFilters as Map<String, dynamic>;
          _controller.refresh();
        },
      ),
      headerBuilder: (context, setState) => const BottomSheetHeaderText(
        headerText: 'Filter Notifications',
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return NestedScroll(
      header: (context, _) {
        return [
          SliverAppBar(
            expandedHeight: 150,
            collapsedHeight: 100,
            pinned: true,
            elevation: 2,
            backgroundColor:
                Provider.of<PaletteSettings>(context).currentSetting.primary,
            flexibleSpace: GestureDetector(
              onTap: () {
                setState(() {
                  expanded = !expanded;
                });
              },
              child: CollapsibleAppBar(
                minHeight: 100,
                maxHeight: 150,
                expandedParentPadding: 0,
                title: 'Inbox',
                trailing: IconButton(
                  icon: const Icon(Icons.sort),
                  onPressed: () {
                    setState(() {
                      expanded = !expanded;
                    });
                  },
                ),
              ),
            ),
          ),
        ];
      },
      body: Builder(
        builder: (context) {
          NestedScrollView.sliverOverlapAbsorberHandleFor(context);
          return Column(
            children: [
              SizeExpandedSection(
                expand: expanded,
                child: Column(
                  children: [
                    const Divider(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8),
                      child: Button(
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 24),
                        onTap: () async {
                          setState(() {
                            loadingButton = true;
                          });
                          await NotificationsService.markAllAsRead();
                          setState(() {
                            loadingButton = false;
                          });
                          _controller.refresh();
                        },
                        enabled: !loadingButton,
                        listenToLoadingController: false,
                        color: Provider.of<PaletteSettings>(context)
                            .currentSetting
                            .secondary,
                        elevation: 2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Mark all as read',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            const Icon(
                              LineIcons.checkCircle,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8),
                      child: Button(
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 24),
                        onTap: showFilterSheet,
                        listenToLoadingController: false,
                        color: Provider.of<PaletteSettings>(context)
                            .currentSetting
                            .secondary,
                        elevation: 2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Filter Inbox',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            const Icon(
                              LineIcons.filter,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Divider(),
                  ],
                ),
              ),
              Expanded(
                child: InfiniteScrollWrapper<NotificationModel>(
                  controller: _controller,
                  separatorBuilder: (context, index) => const Divider(
                    height: 0,
                  ),
                  topSpacing: 16,
                  future: (pageNumber, pageSize, refresh, _) {
                    return NotificationsService.getNotifications(
                        page: pageNumber,
                        perPage: pageSize,
                        refresh: refresh,
                        filters: apiFilters);
                  },
                  filterFn: (list) {
                    final filtered = <NotificationModel>[];
                    for (final element in list) {
                      if (checkFilter(element)!) {
                        filtered.add(element);
                      }
                    }
                    return filtered;
                  },
                  builder: (context, item, index, refresh) {
                    if (item.subject!.type == SubjectType.ISSUE) {
                      return IssueNotificationCard(
                        item,
                        refresh: refresh,
                      );
                    } else if (item.subject!.type == SubjectType.PULL_REQUEST) {
                      return PullRequestNotificationCard(
                        item,
                        refresh: refresh,
                      );
                    }
                    return Container();
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

// class UnauthenticatedNotificationsReplacement extends StatelessWidget {
//   const UnauthenticatedNotificationsReplacement({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         NestedScrollView(
//             headerSliverBuilder: (context, _) {
//               return [
//                 SliverOverlapAbsorber(
//                   handle:
//                       NestedScrollView.sliverOverlapAbsorberHandleFor(context),
//                   sliver: SliverAppBar(
//                     expandedHeight: 150,
//                     collapsedHeight: 100,
//                     pinned: true,
//                     elevation: 2,
//                     backgroundColor: Provider.of<PaletteSettings>(context).currentSetting.background,
//                     flexibleSpace: GestureDetector(
//                       child: const CollapsibleAppBar(
//                         minHeight: 100,
//                         maxHeight: 150,
//                         expandedParentPadding: 0,
//                         title: 'Inbox',
//                         trailing: IconButton(
//                           icon: Icon(
//                             Icons.sort,
//                             color: Colors.white,
//                           ),
//                           onPressed: null,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ];
//             },
//             body: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: const [
//                 Padding(
//                   padding: EdgeInsets.all(16.0),
//                   child: LoginPromptBox(),
//                 ),
//               ],
//             )),
//       ],
//     );
//   }
// }
