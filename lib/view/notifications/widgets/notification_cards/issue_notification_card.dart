import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:onehub/common/shimmer_widget.dart';
import 'package:onehub/models/events/notifications_model.dart';
import 'package:onehub/models/issues/issue_comments_model.dart';
import 'package:onehub/models/issues/issue_event_model.dart';
import 'package:onehub/models/issues/issue_model.dart';
import 'package:onehub/routes/router.gr.dart';
import 'package:onehub/services/issues/issues_service.dart';
import 'package:onehub/view/notifications/widgets/notification_cards/basic_notification_card.dart';
import 'package:onehub/view/notifications/widgets/notification_cards/card_footer.dart';

class IssueNotificationCard extends StatefulWidget {
  final NotificationModel notification;
  IssueNotificationCard(this.notification, {Key? key});

  @override
  _IssueNotificationCardState createState() => _IssueNotificationCardState();
}

class _IssueNotificationCardState extends State<IssueNotificationCard>
    with AutomaticKeepAliveClientMixin {
  late IssueModel issueInfo;
  late IssueCommentsModel latestComment;
  IssueEventModel? latestIssueEvent;
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
    List<Future> futures = [
      IssuesService.getIssueInfo(fullUrl: widget.notification.subject!.url!),
      IssuesService.getLatestComment(
          fullUrl: widget.notification.subject!.latestCommentUrl!),
      IssuesService.getIssueEvents(fullUrl: widget.notification.subject!.url!)
    ];
    List<dynamic> results = await Future.wait(futures);
    issueInfo = results[0];
    latestComment = results[1];
    // Get latest event to compare with the latest comment.
    List issueEvents = results[2];
    if (issueEvents.isNotEmpty) latestIssueEvent = issueEvents.last;
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BasicNotificationCard(
      iconBuilder: (context) {
        return getIcon();
      },
      onTap: () {
        AutoRouter.of(context).push(IssueScreenRoute(
            issueURL: widget.notification.subject!.url,
            repoURL: widget.notification.repository!.url,
            initialIndex: 1,
            commentsSince: latestComment.createdAt));
      },
      loading: loading,
      footerBuilder: (context) {
        if (!loading) return getIssueFooter();
        return Container();
      },
      notification: widget.notification,
    );
  }

  Widget getIssueFooter() {
    // If latest event is after latest comment, show in preview.
    if (latestIssueEvent != null &&
        latestIssueEvent!.createdAt!.isAfter(latestComment.createdAt!)) {
      // Todo: Update issue event model and add more cases.
      if (latestIssueEvent!.event == 'assigned')
        return CardFooter(
            latestIssueEvent!.actor!.avatarUrl,
            'Assigned #${issueInfo.number} to ${latestIssueEvent!.assignee!.login}',
            widget.notification.unread);
      else if (latestIssueEvent!.event == 'reopened')
        return CardFooter(latestIssueEvent!.actor!.avatarUrl,
            'Reopened #${issueInfo.number}', widget.notification.unread);
      else if (latestIssueEvent!.event == 'closed')
        return CardFooter(latestIssueEvent!.actor!.avatarUrl,
            'Closed #${issueInfo.number}', widget.notification.unread);
    }
    // Return latest comment.
    return CardFooter(latestComment.user!.avatarUrl, latestComment.body,
        widget.notification.unread);
  }

  Widget getIcon() {
    if (!loading) {
      if (issueInfo.state == IssueState.CLOSED)
        return Icon(
          Octicons.issue_closed,
          color: Colors.red,
          size: iconSize,
        );
      else if (issueInfo.state == IssueState.OPEN)
        return Icon(
          Octicons.issue_opened,
          color: Colors.green,
          size: iconSize,
        );
      else if (issueInfo.state == IssueState.REOPENED)
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
