import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:onehub/common/loading_indicator.dart';
import 'package:onehub/models/notifications/notifications_model.dart';
import 'package:onehub/services/activity/notifications_service.dart';
import 'package:onehub/view/notifications/widgets/issue_notification_card.dart';
import 'package:onehub/view/notifications/widgets/pull_request_notification_card.dart';

class InfiniteNotificationScroll extends StatefulWidget {
  InfiniteNotificationScroll({Key key}) : super(key: key);

  @override
  _InfiniteNotificationScrollState createState() =>
      _InfiniteNotificationScrollState();
}

class _InfiniteNotificationScrollState
    extends State<InfiniteNotificationScroll> {
  static const _pageSize = 5;
  int pageNumber = 0;
  final PagingController<int, NotificationModel> _pagingController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  @override
  void didUpdateWidget(covariant InfiniteNotificationScroll oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems = await NotificationsService.getNotifications(
          page: pageNumber, perPage: _pageSize);
      final isLastPage = newItems.length < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        pageNumber++;
        final nextPageKey = pageKey + newItems.length;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return PagedListView<int, NotificationModel>(
      pagingController: _pagingController,
      builderDelegate: PagedChildBuilderDelegate<NotificationModel>(
          itemBuilder: (context, item, index) {
        return Column(
          children: [
            Divider(),
            Builder(builder: (context) {
              if (item.subject.type == 'Issue')
                return IssueNotificationCard(item);
              else if (item.subject.type == 'PullRequest')
                return PullRequestNotificationCard(item);
              return Container();
            }),
          ],
        );
      }, firstPageProgressIndicatorBuilder: (context) {
        return LoadingIndicator();
      }),
    );
  }
}
