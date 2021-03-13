import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:onehub/common/animations/size_expanded_widget.dart';
import 'package:onehub/common/bottom_sheet.dart';
import 'package:onehub/common/button.dart';
import 'package:onehub/common/collapsible_app_bar.dart';
import 'package:onehub/common/infinite_scroll_wrapper.dart';
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
  bool checkFilter(NotificationModel notification) {
    bool allowed = true;
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
          apiFilters = updatedAPIFilters;
          clientFilters = updatedClientFilters;
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
                      onTap: () {
                        setState(() {
                          expanded = !expanded;
                        });
                      },
                      child: CollapsibleAppBar(
                        minHeight: 100,
                        maxHeight: 150,
                        expandedParentPadding: 0,
                        title: 'Notifications',
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
              ];
            },
            body: Builder(
              builder: (context) {
                NestedScrollView.sliverOverlapAbsorberHandleFor(context);
                return Padding(
                  padding: const EdgeInsets.only(top: 100.0),
                  child: Column(
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
                                      'Filter Notifications',
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
                      Expanded(
                        child: InfiniteScrollWrapper<NotificationModel>(
                          controller: _controller,
                          spacing: 0,
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
                              if (checkFilter(element)) filtered.add(element);
                            });
                            return filtered;
                          },
                          builder: (context, NotificationModel item, index) {
                            if (item.subject.type == SubjectEnum.issue)
                              return IssueNotificationCard(item);
                            else if (item.subject.type ==
                                SubjectEnum.pullRequest)
                              return PullRequestNotificationCard(item);
                            return Container();
                          },
                        ),
                      ),
                    ],
                  ),
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
                      'Notifications',
                      style: Theme.of(context).textTheme.headline4.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: IconButton(
                        icon: Icon(Icons.sort),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
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
