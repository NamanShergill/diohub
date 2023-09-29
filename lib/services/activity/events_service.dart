import 'package:dio_hub/app/api_handler/dio.dart';
import 'package:dio_hub/models/events/events_model.dart';

class EventsService {
  static final RESTHandler _restHandler = RESTHandler(
      // apiLogSettings: APILoggingSettings.comprehensive(),
      );

  // Ref: https://docs.github.com/en/rest/reference/activity#list-events-for-the-authenticated-user
  static Future<List<EventsModel>> getUserEvents(
    final String? user, {
    required final bool refresh,
    final int? page,
    final int? perPage,
  }) async {
    final response = await _restHandler.get(
      '/users/$user/events',
      queryParameters: {'per_page': perPage, 'page': page},
      refreshCache: refresh,
    );
    final List unParsedEvents = response.data;
    final parsedEvents = <EventsModel>[];
    for (final event in unParsedEvents) {
      parsedEvents.add(EventsModel.fromJson(event));
    }
    return parsedEvents;
  }

  // Ref: https://docs.github.com/en/rest/reference/activity#list-events-received-by-the-authenticated-user
  static Future<List<EventsModel>> getReceivedEvents(
    final String? user, {
    final bool refresh = false,
    final int? perPage,
    final int? page,
  }) async {
    final parameters = <String, dynamic>{'per_page': perPage, 'page': page};
    final response = await _restHandler.get<List>(
      '/users/$user/received_events',
      queryParameters: parameters,
      refreshCache: refresh,
    );
    return response.data!
        .map(
          // ignore: unnecessary_lambdas
          (final e) => EventsModel.fromJson(e),
        )
        .toList();
  }

  // Ref: https://docs.github.com/en/rest/reference/activity#list-public-events
  static Future<List<EventsModel>> getPublicEvents({
    final bool refresh = false,
    final int? perPage,
    final int? page,
  }) async {
    final parameters = <String, dynamic>{'per_page': perPage, 'page': page};
    final response = await _restHandler.get<List>(
      '/events',
      queryParameters: parameters,
      refreshCache: refresh,
    );
    return response.data!
        .map(
          // ignore: unnecessary_lambdas
          (final e) => EventsModel.fromJson(e),
        )
        .toList();
  }
}
