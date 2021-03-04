import 'package:flutter/material.dart';
import 'package:onehub/models/notifications/notifications_model.dart';
import 'package:onehub/style/colors.dart';

class BasicNotificationCard extends StatelessWidget {
  final Widget icon;
  final String date;
  final Widget footer;
  final NotificationModel notification;
  BasicNotificationCard({this.footer, this.icon, this.date, this.notification});
  @override
  Widget build(BuildContext context) {
    return Material(
      color: notification.unread ? AppColor.onBackground : Colors.transparent,
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
                    child: icon,
                  ),
                  Visibility(
                      visible: notification.unread,
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
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              notification.repository.fullName,
                              style: TextStyle(color: AppColor.grey3),
                            ),
                          ),
                        ),
                        Text(
                          date,
                          style: TextStyle(color: AppColor.grey3),
                        ),
                      ],
                    ),
                    Flexible(
                      child: Text(
                        notification.subject.title,
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
                    footer ?? Container(),
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
    );
  }
}
