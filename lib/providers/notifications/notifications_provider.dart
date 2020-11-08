import 'package:gitapp/models/notiifications/notifications_model.dart';
import 'package:gitapp/providers/base_provider.dart';

import 'file:///D:/Programming/Flutter/gitApp/lib/services/activity/notifications_service.dart';

class NotificationsProvider extends BaseProvider {
  List<NotificationModel> _notifications;

  List<NotificationModel> get notifications => _notifications;

  Future<List<NotificationModel>> getAllNotifications() async {
    await NotificationsService.getAllNotifications().then((value) {
      _notifications = value;
    });
    return _notifications;
  }
}
