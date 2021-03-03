import 'package:onehub/app/Dio/cache.dart';
import 'package:onehub/app/Dio/dio.dart';
import 'package:onehub/models/notifications/notifications_model.dart';

class NotificationsService {
  static String _url = '/notifications';

  static Future<List<NotificationModel>> getNotifications(
      {bool refresh = false, int perPage, int page}) async {
    List<NotificationModel> notifications = await GetDio.getDio().get(_url,
        options: CacheManager.notifications(),
        queryParameters: {
          'per_page': perPage,
          'page': page,
          'all': true
        }).then((value) {
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
