import 'package:dio/dio.dart';
import 'package:dio_hub/app/Dio/cache.dart';
import 'package:dio_hub/app/Dio/dio.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:dio_hub/models/events/events_model.dart';

class EventsService {
  // Ref: https://docs.github.com/en/rest/reference/activity#list-events-for-the-authenticated-user
  static Future<List<EventsModel>> getUserEvents(String? user,
      {int? page, int? perPage, required bool refresh}) async {
    Response response = await GetDio.getDio(
            cacheOptions: CacheManager.defaultCache(refresh: refresh))
        .get('/users/$user/events',
            queryParameters: {'per_page': perPage, 'page': page});
    List unParsedEvents = response.data;
    List<EventsModel> parsedEvents = [];
    for (var event in unParsedEvents) {
      parsedEvents.add(EventsModel.fromJson(event));
    }
    return parsedEvents;
  }

  // Ref: https://docs.github.com/en/rest/reference/activity#list-events-received-by-the-authenticated-user
  static Future<List<EventsModel>> getReceivedEvents(String? user,
      {bool refresh = false, int? perPage, int? page}) async {
    Map<String, dynamic> parameters = {'per_page': perPage, 'page': page};
    Response response =
        await GetDio.getDio(cacheOptions: CacheManager.events(refresh: refresh))
            .get('/users/$user/received_events', queryParameters: parameters);
    List unParsedEvents = response.data;
    List<EventsModel> parsedEvents = [];
    for (var event in unParsedEvents) {
      parsedEvents.add(EventsModel.fromJson(event));
    }
    return parsedEvents;
  }

  // Ref: https://docs.github.com/en/rest/reference/activity#list-public-events
  static Future<List<EventsModel>> getPublicEvents(
      {bool refresh = false, int? perPage, int? page}) async {
    Map<String, dynamic> parameters = {'per_page': perPage, 'page': page};
    Response response =
        await GetDio.getDio(cacheOptions: CacheManager.events(refresh: refresh))
            .get(
      '/events',
      queryParameters: parameters,
    );
    // Todo: Change this.
    List unParsedEvents = response.data;
    List<EventsModel> parsedEvents = [];
    for (var event in unParsedEvents) {
      parsedEvents.add(EventsModel.fromJson(event));
    }
    return parsedEvents;
  }
}
