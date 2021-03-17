import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:onehub/common/shimmer_widget.dart';
import 'package:onehub/models/events/notifications_model.dart';
import 'package:onehub/models/issues/issue_model.dart';
import 'package:onehub/models/pull_requests/pull_request_model.dart';
import 'package:onehub/models/pull_requests/review_model.dart';
import 'package:onehub/routes/router.gr.dart';
import 'package:onehub/services/pulls/pulls_service.dart';
import 'package:onehub/view/notifications/widgets/notification_cards/basic_notification_card.dart';
import 'package:onehub/view/notifications/widgets/notification_cards/card_footer.dart';

class PullRequestNotificationCard extends StatefulWidget {
  final NotificationModel notification;
  PullRequestNotificationCard(this.notification);
  @override
  _PullRequestNotificationCardState createState() =>
      _PullRequestNotificationCardState();
}

class _PullRequestNotificationCardState
    extends State<PullRequestNotificationCard>
    with AutomaticKeepAliveClientMixin {
  PullRequestModel pullRequest;
  List<ReviewModel> reviews;
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
    // Get more information on the pull request to display
    // Todo: Update pull notification cards when I figure out how Github does it.
    List<Future> futures = [
      PullsService.getPullInformation(fullUrl: widget.notification.subject.url),
      // PullsService.getPullReviews(fullUrl: widget.notification.subject.url),
    ];
    List<dynamic> data = await Future.wait(futures);
    pullRequest = data[0];
    // reviews = data[1];
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BasicNotificationCard(
      notification: widget.notification,
      iconBuilder: (context) {
        return getIcon();
      },
      onTap: () {
        return AutoRouter.of(context)
            .push(PullScreenRoute(pullURL: widget.notification.subject.url));
      },
      footerBuilder: (context) {
        if (!loading) {
          return getPullFooter();
        }
        return null;
      },
    );
  }

  Widget getPullFooter() {
    return CardFooter(
        pullRequest.user.avatarUrl,
        'Status: ${pullRequest.merged ? 'Merged' : stateValues.reverse[pullRequest.state].substring(0, 1).toUpperCase() + stateValues.reverse[pullRequest.state].substring(1)}',
        widget.notification.unread);
  }

  Widget getIcon() {
    if (!loading) {
      if (pullRequest.state == IssueState.CLOSED) {
        if (pullRequest.merged)
          return Icon(
            Octicons.git_merge,
            color: Colors.deepPurpleAccent,
            size: iconSize,
          );
        else
          return Icon(
            Octicons.git_pull_request,
            color: Colors.red,
            size: iconSize,
          );
      } else if (pullRequest.state == IssueState.OPEN)
        return Icon(
          Octicons.git_pull_request,
          color: Colors.green,
          size: iconSize,
        );
      else
        return Icon(
          Octicons.git_pull_request,
          color: Colors.grey,
          size: iconSize,
        );
    }
    return ShimmerWidget(
      child: Icon(
        Octicons.git_pull_request,
        size: iconSize,
      ),
    );
  }
}
