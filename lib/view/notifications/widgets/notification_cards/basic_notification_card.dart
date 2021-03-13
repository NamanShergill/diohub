import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:line_icons/line_icons.dart';
import 'package:onehub/common/animations/size_expanded_widget.dart';
import 'package:onehub/common/shimmer_widget.dart';
import 'package:onehub/models/events/notifications_model.dart';
import 'package:onehub/services/activity/notifications_service.dart';
import 'package:onehub/style/borderRadiuses.dart';
import 'package:onehub/style/colors.dart';
import 'package:onehub/utils/get_date.dart';

class BasicNotificationCard extends StatefulWidget {
  final WidgetBuilder iconBuilder;
  final WidgetBuilder footerBuilder;
  final NotificationModel notification;
  final Function onTap;
  BasicNotificationCard(
      {this.footerBuilder, this.onTap, this.iconBuilder, this.notification});

  @override
  _BasicNotificationCardState createState() => _BasicNotificationCardState();
}

class _BasicNotificationCardState extends State<BasicNotificationCard> {
  // Need to add a key to Slidable's child widget
  // to prevent unnecessary rebuilds.
  GlobalKey key = GlobalKey();

  void markAsRead() {
    HapticFeedback.vibrate();
    NotificationsService.markThreadAsRead(widget.notification.id);
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
        key: key,
        color: widget.notification.unread
            ? AppColor.onBackground
            : Colors.transparent,
        child: InkWell(
          onTap: () {
            markAsRead();
            widget.onTap();
          },
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
                            getDate(widget.notification.updatedAt),
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
            borderRadius: AppThemeBorderRadius.medBorderRadius,
            child: Container(
              decoration: BoxDecoration(
                color: AppColor.grey,
              ),
              height: 20,
            ),
          ),
        ),
      ],
    );
  }
}
