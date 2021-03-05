import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icons.dart';
import 'package:onehub/app/Dio/dio.dart';
import 'package:onehub/common/animations/size_expanded_widget.dart';
import 'package:onehub/common/shimmer_widget.dart';
import 'package:onehub/models/notifications/notifications_model.dart';
import 'package:onehub/style/colors.dart';

class BasicNotificationCard extends StatefulWidget {
  final WidgetBuilder iconBuilder;
  final WidgetBuilder footerBuilder;
  final NotificationModel notification;
  BasicNotificationCard(
      {this.footerBuilder, this.iconBuilder, this.notification});

  @override
  _BasicNotificationCardState createState() => _BasicNotificationCardState();
}

class _BasicNotificationCardState extends State<BasicNotificationCard> {
  void markAsRead() {
    HapticFeedback.vibrate();
    GetDio.getDio().patch('/notifications/threads/${widget.notification.id}');
    setState(() {
      widget.notification.unread = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      enabled: widget.notification.unread,
      actions: [
        IconSlideAction(
          icon: LineIcons.check,
          color: AppColor.success,
          caption: 'Mark as read',
          onTap: () {
            markAsRead();
          },
        ),
      ],
      secondaryActions: [
        IconSlideAction(
          icon: LineIcons.check,
          color: AppColor.success,
          caption: 'Mark as read',
          onTap: () {
            markAsRead();
          },
        ),
      ],
      actionExtentRatio: 0.4,
      dismissal: SlidableDismissal(
        child: SizeExpandedSection(
          axis: Axis.horizontal,
          animationCurve: Curves.easeOutExpo,
          child: Container(
            height: 120,
            color: AppColor.success,
            child: Center(
              child: Text('Mark as read?'),
            ),
          ),
        ),
        onWillDismiss: (_) {
          markAsRead();
          return false;
        },
        closeOnCanceled: true,
        dismissThresholds: {
          SlideActionType.primary: 0.4,
          SlideActionType.secondary: 0.4
        },
      ),
      key: UniqueKey(),
      child: Material(
        color: widget.notification.unread
            ? AppColor.onBackground
            : Colors.transparent,
        child: InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Row(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: widget.iconBuilder(context),
                    ),
                    Visibility(
                        visible: widget.notification.unread,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipOval(
                            child: Container(
                              height: 10,
                              width: 10,
                              color: AppColor.accent,
                            ),
                          ),
                        )),
                  ],
                ),
                SizedBox(
                  width: 8,
                ),
                Flexible(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Text(
                                widget.notification.repository.fullName,
                                style: TextStyle(color: AppColor.grey3),
                              ),
                            ),
                          ),
                          Text(
                            getDate(),
                            style: TextStyle(color: AppColor.grey3),
                          ),
                        ],
                      ),
                      Flexible(
                        child: Text(
                          widget.notification.subject.title,
                          style: TextStyle(
                              color: widget.notification.unread
                                  ? Colors.white
                                  : AppColor.grey3,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      widget.footerBuilder(context) ?? footerLoading(),
                      SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget footerLoading() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ShimmerWidget(
          child: ClipOval(
            child: Container(
              height: 20,
              width: 20,
              color: Colors.grey,
            ),
          ),
        ),
        SizedBox(
          width: 8,
        ),
        Expanded(
          child: ShimmerWidget(
            child: Container(
              decoration: BoxDecoration(
                color: AppColor.grey,
                borderRadius: BorderRadius.circular(10),
              ),
              height: 20,
            ),
          ),
        ),
      ],
    );
  }

  String getDate() {
    String date = widget.notification.updatedAt;

    // Todo: I can't figure out how GitHub decides the dates on notifications. Do this later.

    //If notification reason is assign, it will show issue creation date.
    // if (widget.notification.reason == 'assign')
    //   date = widget.notification.updatedAt;
    // else {
    //   if (DateTime.parse(latestIssueEvent.createdAt)
    //       .isAfter(DateTime.parse(latestComment.createdAt)))
    //     date = latestIssueEvent.createdAt;
    //   else
    //     date = latestComment.createdAt;
    // }
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
}
