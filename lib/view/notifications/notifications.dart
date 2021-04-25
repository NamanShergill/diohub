import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:onehub/common/animations/size_expanded_widget.dart';
import 'package:onehub/common/bottom_sheet.dart';
import 'package:onehub/common/button.dart';
import 'package:onehub/common/collapsible_app_bar.dart';
import 'package:onehub/common/infinite_scroll_wrapper.dart';
import 'package:onehub/common/loading_indicator.dart';
import 'package:onehub/common/login_check_wrapper.dart';
import 'package:onehub/models/events/notifications_model.dart';
import 'package:onehub/services/activity/notifications_service.dart';
import 'package:onehub/style/colors.dart';
import 'package:onehub/view/notifications/widgets/filter_sheet.dart';
import 'package:onehub/view/notifications/widgets/notification_cards/issue_notification_card.dart';
import 'package:onehub/view/notifications/widgets/notification_cards/pull_request_notification_card.dart';

class NotificationsScreen extends StatefulWidget {
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
  InfiniteScrollWrapperController _controller =
      InfiniteScrollWrapperController();

  /// 'Mark all as read" button status.
  bool loadingButton = false;

  /// Function to check if a specific notification fits the user filter or not.
  bool? checkFilter(NotificationModel notification) {
    bool? allowed = true;
    if (clientFilters['show_only'].isNotEmpty)
      allowed = clientFilters['show_only'].contains(notification.reason);
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
    return LoginCheckWrapper(
      child: Stack(
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
                            icon: Icon(Icons.sort),
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
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 8),
                            child: Button(
                              padding: EdgeInsets.symmetric(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Mark all as read',
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                  Icon(
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
                              padding: EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 24),
                              onTap: () {
                                showFilterSheet();
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Filter Inbox',
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                  Icon(
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
                          Divider(),
                        ],
                      ),
                    ),
                    true
                        ? LoadingIndicator()
                        : Expanded(
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
                                list.forEach((element) {
                                  if (checkFilter(element)!)
                                    filtered.add(element);
                                });
                                return filtered;
                              },
                              builder:
                                  (context, NotificationModel item, index) {
                                if (item.subject!.type == SubjectType.ISSUE)
                                  return IssueNotificationCard(item);
                                else if (item.subject!.type ==
                                    SubjectType.PULL_REQUEST)
                                  return PullRequestNotificationCard(item);
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
      ),
      replacement: UnauthenticatedNotificationsReplacement(),
    );
  }
}

class UnauthenticatedNotificationsReplacement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        NestedScrollView(
            headerSliverBuilder: (context, _) {
              return [
                SliverOverlapAbsorber(
                  handle:
                      NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                  sliver: SliverAppBar(
                    expandedHeight: 150,
                    collapsedHeight: 100,
                    pinned: true,
                    elevation: 2,
                    backgroundColor: AppColor.background,
                    flexibleSpace: GestureDetector(
                      child: CollapsibleAppBar(
                        minHeight: 100,
                        maxHeight: 150,
                        expandedParentPadding: 0,
                        title: 'Inbox',
                        trailing: IconButton(
                          icon: Icon(
                            Icons.sort,
                            color: Colors.white,
                          ),
                          onPressed: null,
                        ),
                      ),
                    ),
                  ),
                ),
              ];
            },
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: LoginPromptBox(),
                ),
              ],
            )),
      ],
    );
  }
}
