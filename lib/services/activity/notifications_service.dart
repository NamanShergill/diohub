import 'package:onehub/app/Dio/cache.dart';
import 'package:onehub/app/Dio/dio.dart';
import 'package:onehub/models/notifications/notifications_model.dart';

class NotificationsService {
  static String _url = '/notifications';

  /// Fetch notifications. API Endpoint: '/notifications'.
  /// Add notification filters in the [filters] parameter as a [Map].
  static Future<List<NotificationModel>> getNotifications(
      {bool refresh = false, int perPage, int page, Map filters}) async {
    // Map the request parameters.
    Map<String, dynamic> queryParameters = {
      'per_page': perPage,
      'page': page,
      'all': true
    };
    // Add filters, if any, to the parameters.
    if (filters != null) queryParameters.addAll(filters);
    // Make API request to get a list of notifications;
    List<NotificationModel> notifications = await GetDio.getDio()
        .get(
      _url,
      options: CacheManager.notifications(),
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
}
