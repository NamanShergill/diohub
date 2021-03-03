import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:intl/intl.dart';
import 'package:onehub/app/Dio/cache.dart';
import 'package:onehub/app/Dio/dio.dart';
import 'package:onehub/common/shimmer_widget.dart';
import 'package:onehub/models/issues/issue_comments_model.dart';
import 'package:onehub/models/issues/issue_event_model.dart';
import 'package:onehub/models/issues/issue_model.dart';
import 'package:onehub/models/notifications/notifications_model.dart';
import 'package:onehub/style/colors.dart';
import 'package:onehub/view/notifications/widgets/basic_notification_card.dart';

class IssueNotificationCard extends StatefulWidget {
  final NotificationModel notification;
  IssueNotificationCard(this.notification, {Key key});

  @override
  _IssueNotificationCardState createState() => _IssueNotificationCardState();
}

class _IssueNotificationCardState extends State<IssueNotificationCard>
    with AutomaticKeepAliveClientMixin {
  IssueModel issueInfo;
  IssueCommentsModel latestComment;
  IssueEventModel latestIssueEvent;
  bool loading = true;
  double iconSize = 20;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    getInfo();
    super.initState();
  }

  void getInfo() async {
    // Get more information on issue to display
    Response response = await GetDio.getDio(applyBaseURL: false).get(
        widget.notification.subject.url,
        options: CacheManager.defaultCache());
    issueInfo = IssueModel.fromJson(response.data);
    // Get latest comment for preview.
    response = await GetDio.getDio(applyBaseURL: false).get(
        widget.notification.subject.latestCommentUrl,
        options: CacheManager.defaultCache());
    latestComment = IssueCommentsModel.fromJson(response.data);
    // Get latest event to compare with the latest comment.
    response = await GetDio.getDio(applyBaseURL: false).get(
        widget.notification.subject.url + '/events',
        options: CacheManager.defaultCache());
    latestIssueEvent = IssueEventModel.fromJson(response.data.last);
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BasicNotificationCard(
      icon: getIcon(),
      date: getDate(),
      footer: getIssueFooter(),
      notification: widget.notification,
    );
  }

  Widget getIssueFooter() {
    if (!loading) {
      // If latest event is after latest comment, show in preview.
      if (DateTime.parse(latestIssueEvent.createdAt)
          .isAfter(DateTime.parse(latestComment.createdAt))) {
        // Todo: Update issue event model and more cases.
        if (latestIssueEvent.event == 'assigned')
          return footerRow(latestIssueEvent.actor.avatarUrl,
              'Assigned #${issueInfo.number} to ${latestIssueEvent.assignee.login}.');
      }
      // Return latest comment.
      return footerRow(latestComment.user.avatarUrl, latestComment.body);
    }
    return Opacity(
      opacity: 0.5,
      child: ShimmerWidget(
        child: Container(
          decoration: BoxDecoration(
            color: AppColor.grey,
            borderRadius: BorderRadius.circular(10),
          ),
          height: 20,
        ),
      ),
    );
  }

  Widget footerRow(String avatarUrl, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipOval(
          child: CachedNetworkImage(
            imageUrl: avatarUrl,
            height: 20,
            fit: BoxFit.fill,
            placeholder: (context, string) {
              return ShimmerWidget(
                child: Container(
                  color: Colors.grey,
                ),
              );
            },
          ),
        ),
        SizedBox(
          width: 8,
        ),
        Text(
            '${text.substring(0, text.length > 40 ? 40 : text.length)}${text.length > 40 ? '...' : ''}'),
      ],
    );
  }

  String getDate() {
    if (issueInfo != null &&
        latestIssueEvent != null &&
        latestComment != null) {
      String date;
      //If issue is open, GitHub considers the later event/comment's time.
      if (issueInfo.state == 'open') {
        if (DateTime.parse(latestIssueEvent.createdAt)
            .isAfter(DateTime.parse(latestComment.createdAt)))
          date = latestIssueEvent.createdAt;
        else
          date = latestComment.createdAt;
      }
      //If it is closed, it just sees the latest comment date, and ignores the actions.
      else
        date = latestComment.createdAt;

      DateTime _dateTime = DateTime.parse(date);
      Duration _difference = DateTime.now().difference(_dateTime);
      if (_difference.inMinutes < 1) {
        return '${_difference.inSeconds}s';
      } else if (_difference.inHours < 1) {
        return '${_difference.inMinutes}m';
      } else if (_difference.inDays < 1) {
        return '${_difference.inHours}h';
      } else if (_difference.inDays < 31) {
        return '${_difference.inDays}d';
      } else {
        return '${DateFormat('d MMM').format(_dateTime)}';
      }
    }
    return '...';
  }

  Widget getIcon() {
    if (!loading) {
      if (issueInfo.state == 'closed')
        return Icon(
          Octicons.issue_closed,
          color: Colors.red,
          size: iconSize,
        );
      else if (issueInfo.state == 'open')
        return Icon(
          Octicons.issue_opened,
          color: Colors.green,
          size: iconSize,
        );
      else if (issueInfo.state == 'reopened')
        return Icon(
          Octicons.issue_reopened,
          color: Colors.green,
          size: iconSize,
        );
      else
        return Icon(
          Octicons.issue_opened,
          color: Colors.grey,
          size: iconSize,
        );
    }
    return ShimmerWidget(
      child: Icon(
        Octicons.issue_opened,
        size: iconSize,
      ),
    );
  }
}
