import 'package:dio_hub/common/animations/size_expanded_widget.dart';
import 'package:dio_hub/common/misc/bottom_sheet.dart';
import 'package:dio_hub/common/misc/button.dart';
import 'package:dio_hub/common/misc/collapsible_app_bar.dart';
import 'package:dio_hub/common/wrappers/infinite_scroll_wrapper.dart';
import 'package:dio_hub/models/events/notifications_model.dart';
import 'package:dio_hub/services/activity/notifications_service.dart';
import 'package:dio_hub/style/colors.dart';
import 'package:dio_hub/view/notifications/widgets/filter_sheet.dart';
import 'package:dio_hub/view/notifications/widgets/notification_cards/issue_notification_card.dart';
import 'package:dio_hub/view/notifications/widgets/notification_cards/pull_request_notification_card.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);
  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen>
    with AutomaticKeepAliveClientMixin {
  final ScrollController scrollController = ScrollController();

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
    showScrollableBottomActionsMenu(context, titleText: 'Filter Notifications',
        child: (context, scrollController) {
      return FilterSheet(
        apiFilters: apiFilters,
        controller: scrollController,
        clientFilters: clientFilters,
        onFiltersChanged: (Map updatedAPIFilters, Map updatedClientFilters) {
          apiFilters = updatedAPIFilters as Map<String, dynamic>;
          clientFilters = updatedClientFilters as Map<String, dynamic>;
          _controller.refresh();
        },
      );
    });
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Stack(
      children: [
        NestedScrollView(
          controller: scrollController,
          headerSliverBuilder: (context, _) {
            return [
              SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverSafeArea(
                  sliver: SliverAppBar(
                    expandedHeight: 150,
                    collapsedHeight: 100,
                    pinned: true,
                    elevation: 2,
                    backgroundColor: AppColor.background,
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
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Mark all as read',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                const Icon(
                                  LineIcons.checkCircle,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                            enabled: !loadingButton,
                            listenToLoadingController: false,
                            color: AppColor.onBackground,
                            elevation: 2,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8),
                          child: Button(
                            padding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 24),
                            onTap: () {
                              showFilterSheet();
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Filter Inbox',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                const Icon(
                                  LineIcons.filter,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                            listenToLoadingController: false,
                            color: AppColor.onBackground,
                            elevation: 2,
                          ),
                        ),
                        const Divider(),
                      ],
                    ),
                  ),
                  Expanded(
                    child: InfiniteScrollWrapper<NotificationModel>(
                      controller: _controller,
                      scrollController: scrollController,
                      spacing: 0,
                      isNestedScrollViewChild: true,
                      future: (pageNumber, pageSize, refresh, _) {
                        return NotificationsService.getNotifications(
                            page: pageNumber,
                            perPage: pageSize,
                            refresh: refresh,
                            filters: apiFilters);
                      },
                      filterFn: (List<NotificationModel> list) {
                        List<NotificationModel> filtered = [];
                        for (NotificationModel element in list) {
                          if (checkFilter(element)!) filtered.add(element);
                        }
                        return filtered;
                      },
                      builder: (context, NotificationModel item, index) {
                        if (item.subject!.type == SubjectType.ISSUE) {
                          return IssueNotificationCard(item);
                        } else if (item.subject!.type ==
                            SubjectType.PULL_REQUEST) {
                          return PullRequestNotificationCard(item);
                        }
                        return Container();
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
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
//                     backgroundColor: AppColor.background,
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
