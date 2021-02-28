import 'package:flutter/material.dart';
import 'package:onehub/app/Dio/cache.dart';
import 'package:onehub/app/Dio/dio.dart';
import 'package:onehub/models/notifications/notifications_model.dart';

class NotificationsService {
  static String _url = '/notifications';

  static Future<List<NotificationModel>> getAllNotifications(
      {bool refresh = false}) async {
    List<NotificationModel> notifications = await GetDio.getDio().get(_url,
        options: CacheManager.notifications(),
        queryParameters: {'all': true}).then((value) {
      debugPrint(value.extra.toString());
      List<NotificationModel> parsedNotifications = [];
      List unParsedNotifications = value.data;
      for (var notification in unParsedNotifications) {
        // parsedNotifications.add(NotificationModel.fromJson(notification));
      }
      return parsedNotifications;
    });
    return notifications;
  }
}
