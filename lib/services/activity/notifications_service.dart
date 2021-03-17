import 'package:onehub/app/Dio/cache.dart';
import 'package:onehub/app/Dio/dio.dart';
import 'package:onehub/models/events/notifications_model.dart';

class NotificationsService {
  static String _url = '/notifications';

  // Fetch notifications. API Endpoint: '/notifications'.
  // Add notification filters in the [filters] parameter as a [Map].
  // Ref: https://docs.github.com/en/rest/reference/activity#list-notifications-for-the-authenticated-user
  static Future<List<NotificationModel>> getNotifications(
      {bool refresh = false, int perPage, int page, filters}) async {
    // Map the request parameters.
    Map<String, dynamic> queryParameters = {
      'per_page': perPage,
      'page': page,
      'all': true
    };
    // Add filters, if any, to the parameters.
    if (filters != null) queryParameters.addAll(filters);
    // Make API request to get a list of notifications;
    List<NotificationModel> notifications = await GetDio.getDio(
      options: CacheManager.notifications(refresh: refresh),
    )
        .get(
      _url,
      queryParameters: queryParameters,
    )
        .then((value) {
      List<NotificationModel> parsedNotifications = [];
      List unParsedNotifications = value.data;
      // Parse data in the list into notification models.
      for (var notification in unParsedNotifications) {
        parsedNotifications.add(NotificationModel.fromJson(notification));
      }
      return parsedNotifications;
    });
    return notifications;
  }

  // Mark a thread as read.
  // Ref: https://docs.github.com/en/rest/reference/activity#mark-a-thread-as-read
  static Future markThreadAsRead(String id) async {
    await GetDio.getDio().patch('/notifications/threads/$id');
  }

  // Mark all notifications as read.
  // Ref: https://docs.github.com/en/rest/reference/activity#mark-notifications-as-read
  static Future markAllAsRead() async {
    await GetDio.getDio().put('/notifications', queryParameters: {
      'last_read_at': DateTime.now().toIso8601String(),
    });
  }
}
