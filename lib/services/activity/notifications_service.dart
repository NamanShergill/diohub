import 'package:dio/dio.dart';
import 'package:dio_hub/app/api_handler/dio.dart';
import 'package:dio_hub/models/events/notifications_model.dart';

class NotificationsService {
  static const String _url = '/notifications';
  static final RESTHandler _restHandler = RESTHandler();

  // Fetch notifications. API Endpoint: '/notifications'.
  // Add notification filters in the [filters] parameter as a [Map].
  // Ref: https://docs.github.com/en/rest/reference/activity#list-notifications-for-the-authenticated-user
  static Future<List<NotificationModel>> getNotifications({
    final int? perPage,
    final int? page,
    final Map<String, dynamic>? filters,
  }) async {
    // Map the request parameters.
    final Map<String, dynamic> queryParameters = <String, dynamic>{
      'per_page': perPage,
      'page': page,
      'all': true,
    };
    // Add filters, if any, to the parameters.
    if (filters != null) {
      queryParameters.addAll(filters);
    }
    // Make API request to get a list of notifications;
    final Response<List<dynamic>> notifications =
        await _restHandler.get<List<dynamic>>(
      _url,
      queryParameters: queryParameters,
      // This has to be true otherwise we will always receive 304 on this endpoint.
      refreshCache: true,
    );
    return notifications.data!
        .map(
          // ignore: unnecessary_lambdas
          (final dynamic e) => NotificationModel.fromJson(e),
        )
        .toList();
  }

  // Mark a thread as read.
  // Ref: https://docs.github.com/en/rest/reference/activity#mark-a-thread-as-read
  static Future<void> markThreadAsRead(final String? id) async {
    await _restHandler.patch('/notifications/threads/$id');
  }

  // Mark all notifications as read.
  // Ref: https://docs.github.com/en/rest/reference/activity#mark-notifications-as-read
  static Future<void> markAllAsRead() async {
    await _restHandler.put(
      '/notifications',
      queryParameters: <String, dynamic>{
        'last_read_at': DateTime.now().toIso8601String(),
      },
    );
  }
}
