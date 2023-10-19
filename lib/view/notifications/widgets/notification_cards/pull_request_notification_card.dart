import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:diohub/adapters/deep_linking_handler.dart';
import 'package:diohub/common/misc/shimmer_widget.dart';
import 'package:diohub/graphql/__generated__/schema.schema.gql.dart';
import 'package:diohub/models/events/notifications_model.dart';
import 'package:diohub/models/issues/issue_model.dart';
import 'package:diohub/models/pull_requests/pull_request_model.dart';
import 'package:diohub/models/pull_requests/review_model.dart';
import 'package:diohub/services/pulls/pulls_service.dart';
import 'package:diohub/view/issues_pulls/issue_pull_screen.dart';
import 'package:diohub/view/notifications/widgets/notification_cards/basic_notification_card.dart';
import 'package:diohub/view/notifications/widgets/notification_cards/card_footer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class PullRequestNotificationCard extends StatefulWidget {
  const PullRequestNotificationCard(
    this.notification, {
    required this.refresh,
    super.key,
  });
  final NotificationModel notification;
  final bool refresh;
  @override
  PullRequestNotificationCardState createState() =>
      PullRequestNotificationCardState();
}

class PullRequestNotificationCardState
    extends State<PullRequestNotificationCard>
    with AutomaticKeepAliveClientMixin {
  late PullRequestModel pullRequest;
  List<ReviewModel>? reviews;
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
    // Get more information on the pull request to display
    // TODO(namanshergill): Update pull notification cards when I figure out how Github does it.
    final List<Future<dynamic>> futures = <Future<dynamic>>[
      PullsService.getPullInformation(
        fullUrl: widget.notification.subject!.url!,
        refresh: widget.refresh,
      ),
      // PullsService.getPullReviews(fullUrl: widget.notification.subject.url),
    ];
    final List<dynamic> data = await Future.wait(futures);
    pullRequest = data[0];
    // reviews = data[1];
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
      notification: widget.notification,
      iconBuilder: (final BuildContext context) => getIcon(),
      onTap: () async => AutoRouter.of(context).push(
        issuePullScreenRoute(
          PathData.fromURL(widget.notification.subject!.url!),
        ),
      ),
      loading: loading,
      footerBuilder: (final BuildContext context) {
        if (!loading) {
          return getPullFooter();
        }
        return Container();
      },
    );
  }

  Widget getPullFooter() => CardFooter(
        pullRequest.user!.avatarUrl,
        'Status: ${pullRequest.merged! ? 'Merged' : stateValues.reverse![pullRequest.state!]!.substring(0, 1).toUpperCase() + stateValues.reverse![pullRequest.state!]!.substring(1)}',
        unread: widget.notification.unread,
      );

  Widget getIcon() {
    if (!loading) {
      if (pullRequest.state == GIssueState.CLOSED) {
        if (pullRequest.merged!) {
          return Icon(
            Octicons.git_merge,
            color: Colors.deepPurpleAccent,
            size: iconSize,
          );
        } else {
          return Icon(
            Octicons.git_pull_request,
            color: Colors.red,
            size: iconSize,
          );
        }
      } else if (pullRequest.state == GIssueState.OPEN) {
        return Icon(
          Octicons.git_pull_request,
          color: Colors.green,
          size: iconSize,
        );
      } else {
        return Icon(
          Octicons.git_pull_request,
          color: Colors.grey,
          size: iconSize,
        );
      }
    }
    return ShimmerWidget(
      child: Icon(
        Octicons.git_pull_request,
        size: iconSize,
      ),
    );
  }
}
