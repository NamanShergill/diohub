import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:dio_hub/common/misc/shimmer_widget.dart';
import 'package:dio_hub/controller/deep_linking_handler.dart';
import 'package:dio_hub/models/events/notifications_model.dart';
import 'package:dio_hub/models/issues/issue_comments_model.dart';
import 'package:dio_hub/models/issues/issue_event_model.dart';
import 'package:dio_hub/models/issues/issue_model.dart';
import 'package:dio_hub/services/issues/issues_service.dart';
import 'package:dio_hub/view/issues_pulls/issue_pull_screen.dart';
import 'package:dio_hub/view/notifications/widgets/notification_cards/basic_notification_card.dart';
import 'package:dio_hub/view/notifications/widgets/notification_cards/card_footer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class IssueNotificationCard extends StatefulWidget {
  const IssueNotificationCard(
    this.notification, {
    required this.refresh,
    super.key,
  });
  final NotificationModel notification;
  final bool refresh;
  @override
  IssueNotificationCardState createState() => IssueNotificationCardState();
}

class IssueNotificationCardState extends State<IssueNotificationCard>
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
    unawaited(getInfo());
    super.initState();
  }

  Future<void> getInfo() async {
    // Get more information on issue to display
    final List<Future<dynamic>> futures = <Future<dynamic>>[
      IssuesService.getIssueInfo(
        fullUrl: widget.notification.subject!.url!,
        refresh: widget.refresh,
      ),
      IssuesService.getLatestComment(
        fullUrl: widget.notification.subject!.latestCommentUrl!,
        refresh: widget.refresh,
      ),
      IssuesService.getIssueEvents(
        fullUrl: widget.notification.subject!.url!,
        refresh: widget.refresh,
      ),
    ];
    final List<dynamic> results = await Future.wait(futures);
    issueInfo = results[0];
    latestComment = results[1];
    // Get latest event to compare with the latest comment.
    final List<IssueEventModel> issueEvents = results[2];
    if (issueEvents.isNotEmpty) {
      latestIssueEvent = issueEvents.last;
    }
    if (mounted) {
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(final BuildContext context) {
    super.build(context);
    return BasicNotificationCard(
      iconBuilder: (final BuildContext context) => getIcon(),
      onTap: () async {
        await AutoRouter.of(context).push(
          issuePullScreenRoute(
            PathData.fromURL(widget.notification.subject!.url!),
          ),
        );
      },
      loading: loading,
      footerBuilder: (final BuildContext context) {
        if (!loading) {
          return getIssueFooter();
        }
        return Container();
      },
      notification: widget.notification,
    );
  }

  Widget getIssueFooter() {
    // If latest event is after latest comment, show in preview.
    if (latestIssueEvent != null &&
        latestIssueEvent!.createdAt!.isAfter(latestComment.createdAt!)) {
      // TODO(namanshergill): Update issue event model and add more cases.
      if (latestIssueEvent!.event == 'assigned') {
        return CardFooter(
          latestIssueEvent!.actor!.avatarUrl,
          'Assigned #${issueInfo.number} to ${latestIssueEvent!.assignee!.login}',
          unread: widget.notification.unread,
        );
      } else if (latestIssueEvent!.event == 'reopened') {
        return CardFooter(
          latestIssueEvent!.actor!.avatarUrl,
          'Reopened #${issueInfo.number}',
          unread: widget.notification.unread,
        );
      } else if (latestIssueEvent!.event == 'closed') {
        return CardFooter(
          latestIssueEvent!.actor!.avatarUrl,
          'Closed #${issueInfo.number}',
          unread: widget.notification.unread,
        );
      }
    }
    // Return latest comment.
    return CardFooter(
      latestComment.user!.avatarUrl,
      latestComment.body,
      unread: widget.notification.unread,
    );
  }

  Widget getIcon() {
    if (!loading) {
      if (issueInfo.state == IssueState.CLOSED) {
        return Icon(
          Octicons.issue_closed,
          color: Colors.red,
          size: iconSize,
        );
      } else if (issueInfo.state == IssueState.OPEN) {
        return Icon(
          Octicons.issue_opened,
          color: Colors.green,
          size: iconSize,
        );
      } else if (issueInfo.state == IssueState.REOPENED) {
        return Icon(
          Octicons.issue_reopened,
          color: Colors.green,
          size: iconSize,
        );
      } else {
        return Icon(
          Octicons.issue_opened,
          color: Colors.grey,
          size: iconSize,
        );
      }
    }
    return ShimmerWidget(
      child: Icon(
        Octicons.issue_opened,
        size: iconSize,
      ),
    );
  }
}
