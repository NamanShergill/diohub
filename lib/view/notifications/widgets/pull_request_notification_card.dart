import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:intl/intl.dart';
import 'package:onehub/app/Dio/cache.dart';
import 'package:onehub/app/Dio/dio.dart';
import 'package:onehub/common/shimmer_widget.dart';
import 'package:onehub/models/notifications/notifications_model.dart';
import 'package:onehub/models/pull_requests/pull_request_model.dart';
import 'package:onehub/style/colors.dart';
import 'package:onehub/view/notifications/widgets/basic_notification_card.dart';

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
    pullRequest = PullRequestModel.fromJson(response.data);
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BasicNotificationCard(
      notification: widget.notification,
      date: getDate(),
      icon: getIcon(),
      footer: getFooter(),
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

  Widget getFooter() {
    if (!loading) {
      return footerRow(pullRequest.user.avatarUrl,
          'Status: ${pullRequest.merged ? 'Merged' : pullRequest.state.substring(0, 1).toUpperCase() + pullRequest.state.substring(1)}');
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

  String getDate() {
    if (pullRequest != null) {
      DateTime _dateTime = DateTime.parse(pullRequest.updatedAt);
      Duration _difference = DateTime.now().difference(_dateTime);
      if (_difference.inMinutes < 1) {
        return '${_difference.inSeconds} s';
      } else if (_difference.inHours < 1) {
        return '${_difference.inMinutes} m';
      } else if (_difference.inDays < 1) {
        return '${_difference.inHours} h';
      } else if (_difference.inDays < 31) {
        return '${_difference.inDays} d';
      } else {
        return '${DateFormat('d MMM').format(_dateTime)}';
      }
    }
    return '...';
  }

  Widget getIcon() {
    if (!loading) {
      if (pullRequest.state == 'closed') {
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
      } else if (pullRequest.state == 'open')
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
