import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:gitapp/models/notiifications/notifications_model.dart';
import 'package:gitapp/style/colors.dart';
import 'package:intl/intl.dart';

class NotificationCard extends StatelessWidget {
  final NotificationModel notification;
  NotificationCard(this.notification);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Card(
        color: AppColor.onBackground,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  getIcon(notification.subject.type),
                  color: Colors.grey,
                  size: 20,
                ),
              ),
              SizedBox(
                width: 4,
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
                              '${notification.repository.owner.login} / ${notification.repository.name}',
                              style: TextStyle(color: AppColor.grey3),
                            ),
                          ),
                        ),
                        Text(
                          getDate(notification.updatedAt),
                          style: TextStyle(color: AppColor.grey3),
                        ),
                      ],
                    ),
                    Flexible(
                      child: Text(
                        notification.subject.title,
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                    Row(
                      children: [],
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

  String getDate(String updatedAt) {
    DateTime _dateTime = DateTime.parse(updatedAt);
    Duration _difference = DateTime.now().difference(DateTime.parse(updatedAt));
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

  IconData getIcon(String type) {
    switch (type) {
      case ("Issue"):
        return Octicons.issue_opened;
      case ("PullRequest"):
        return Octicons.git_pull_request;
      default:
        return Octicons.alert;
    }
  }
}
