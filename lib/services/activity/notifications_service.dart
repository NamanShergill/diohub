import 'package:flutter/material.dart';
import 'package:gitapp/app/Dio/cache.dart';
import 'package:gitapp/app/Dio/dio.dart';
import 'package:gitapp/models/notiifications/notifications_model.dart';

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
        parsedNotifications.add(NotificationModel.fromJson(notification));
      }
      return parsedNotifications;
    });
    return notifications;
  }
}
