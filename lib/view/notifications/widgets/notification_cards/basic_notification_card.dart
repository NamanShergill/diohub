import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:line_icons/line_icons.dart';
import 'package:onehub/app/Dio/dio.dart';
import 'package:onehub/common/animations/size_expanded_widget.dart';
import 'package:onehub/models/notifications/notifications_model.dart';
import 'package:onehub/style/colors.dart';

class BasicNotificationCard extends StatefulWidget {
  final Widget icon;
  final String date;
  final Widget footer;
  final NotificationModel notification;
  BasicNotificationCard({this.footer, this.icon, this.date, this.notification});

  @override
  _BasicNotificationCardState createState() => _BasicNotificationCardState();
}

class _BasicNotificationCardState extends State<BasicNotificationCard> {
  void markAsRead() {
    HapticFeedback.vibrate();
    GetDio.getDio(debugLog: true)
        .patch('/notifications/threads/${widget.notification.id}');
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
                      child: widget.icon,
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
                            widget.date,
                            style: TextStyle(color: AppColor.grey3),
                          ),
                        ],
                      ),
                      Flexible(
                        child: Text(
                          widget.notification.subject.title,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Row(
                        children: [],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      widget.footer ?? Container(),
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
}
