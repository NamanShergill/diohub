import 'package:auto_route/auto_route.dart';
import 'package:dio_hub/app/settings/palette.dart';
import 'package:dio_hub/common/misc/shimmer_widget.dart';
import 'package:dio_hub/models/events/notifications_model.dart';
import 'package:dio_hub/models/issues/issue_model.dart';
import 'package:dio_hub/models/pull_requests/pull_request_model.dart';
import 'package:dio_hub/models/pull_requests/review_model.dart';
import 'package:dio_hub/routes/router.gr.dart';
import 'package:dio_hub/services/pulls/pulls_service.dart';
import 'package:dio_hub/view/notifications/widgets/notification_cards/basic_notification_card.dart';
import 'package:dio_hub/view/notifications/widgets/notification_cards/card_footer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';

class PullRequestNotificationCard extends StatefulWidget {
  const PullRequestNotificationCard(this.notification, {Key? key})
      : super(key: key);
  final NotificationModel notification;
  @override
  _PullRequestNotificationCardState createState() =>
      _PullRequestNotificationCardState();
}

class _PullRequestNotificationCardState
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
    getInfo();
    super.initState();
  }

  void getInfo() async {
    // Get more information on the pull request to display
    // Todo: Update pull notification cards when I figure out how Github does it.
    final futures = <Future>[
      PullsService.getPullInformation(
          fullUrl: widget.notification.subject!.url!),
      // PullsService.getPullReviews(fullUrl: widget.notification.subject.url),
    ];
    final data = await Future.wait(futures);
    pullRequest = data[0];
    // reviews = data[1];
    if (mounted) {
      setState(() {
        loading = false;
      });
    }
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
            .push(PullScreenRoute(pullURL: widget.notification.subject!.url!));
      },
      loading: loading,
      footerBuilder: (context) {
        if (!loading) {
          return getPullFooter();
        }
        return Container();
      },
    );
  }

  Widget getPullFooter() {
    return CardFooter(pullRequest.user!.avatarUrl,
        'Status: ${pullRequest.merged! ? 'Merged' : stateValues.reverse![pullRequest.state!]!.substring(0, 1).toUpperCase() + stateValues.reverse![pullRequest.state!]!.substring(1)}',
        unread: widget.notification.unread);
  }

  Widget getIcon() {
    if (!loading) {
      if (pullRequest.state == IssueState.CLOSED) {
        if (pullRequest.merged!) {
          return Icon(
            Octicons.git_merge,
            color: Colors.deepPurpleAccent,
            size: iconSize,
          );
        } else {
          return Icon(
            Octicons.git_pull_request,
            color: Provider.of<PaletteSettings>(context).currentSetting.red,
            size: iconSize,
          );
        }
      } else if (pullRequest.state == IssueState.OPEN) {
        return Icon(
          Octicons.git_pull_request,
          color: Provider.of<PaletteSettings>(context).currentSetting.green,
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
