import 'package:dio_hub/app/Dio/cache.dart';
import 'package:dio_hub/app/Dio/dio.dart';
import 'package:dio_hub/models/events/notifications_model.dart';

class NotificationsService {
  static const String _url = '/notifications';

  // Fetch notifications. API Endpoint: '/notifications'.
  // Add notification filters in the [filters] parameter as a [Map].
  // Ref: https://docs.github.com/en/rest/reference/activity#list-notifications-for-the-authenticated-user
  static Future<List<NotificationModel>> getNotifications(
      {bool refresh = false,
      int? perPage,
      int? page,
      Map<String, dynamic>? filters}) async {
    // Map the request parameters.
    final queryParameters = <String, dynamic>{
      'per_page': perPage,
      'page': page,
      'all': true
    };
    // Add filters, if any, to the parameters.
    if (filters != null) {
      queryParameters.addAll(filters);
    }
    // Make API request to get a list of notifications;
    final notifications = await API
        .request(
          cacheOptions: CacheManager.notifications(refresh: refresh),
        )
        .get(
          _url,
          queryParameters: queryParameters,
        )
        .then((value) {
      final parsedNotifications = <NotificationModel>[];
      final List unParsedNotifications = value.data;
      // Parse data in the list into notification models.
      for (final notification in unParsedNotifications) {
        parsedNotifications.add(NotificationModel.fromJson(notification));
      }
      return parsedNotifications;
    });
    return notifications;
  }

  // Mark a thread as read.
  // Ref: https://docs.github.com/en/rest/reference/activity#mark-a-thread-as-read
  static Future markThreadAsRead(String? id) async {
    await API.request().patch('/notifications/threads/$id');
  }

  // Mark all notifications as read.
  // Ref: https://docs.github.com/en/rest/reference/activity#mark-notifications-as-read
  static Future markAllAsRead() async {
    await API.request().put('/notifications', queryParameters: {
      'last_read_at': DateTime.now().toIso8601String(),
    });
  }
}
