import 'package:dio/dio.dart';
import 'package:onehub/app/Dio/cache.dart';
import 'package:onehub/app/Dio/dio.dart';
import 'package:onehub/models/events/events_model.dart';

class EventsService {
  // Ref: https://docs.github.com/en/rest/reference/activity#list-events-for-the-authenticated-user
  static Future<List<EventsModel>> getUserEvents(String user,
      {int page, int perPage, bool refresh}) async {
    Response response = await GetDio.getDio().get('/users/$user/events',
        queryParameters: {'per_page': perPage, 'page': page},
        options: CacheManager.defaultCache(refresh));
    List unParsedEvents = response.data;
    List<EventsModel> parsedEvents = [];
    for (var event in unParsedEvents) {
      parsedEvents.add(EventsModel.fromJson(event));
    }
    return parsedEvents;
  }

  // Ref: https://docs.github.com/en/rest/reference/activity#list-events-received-by-the-authenticated-user
  static Future<List<EventsModel>> getReceivedEvents(String user,
      {bool refresh = false, int perPage, int page}) async {
    Map<String, dynamic> parameters = {'per_page': perPage, 'page': page};
    Response response = await GetDio.getDio().get(
        '/users/$user/received_events',
        queryParameters: parameters,
        options: CacheManager.events(refresh));
    List unParsedEvents = response.data;
    List<EventsModel> parsedEvents = [];
    for (var event in unParsedEvents) {
      parsedEvents.add(EventsModel.fromJson(event));
    }
    return parsedEvents;
  }

  // Ref: https://docs.github.com/en/rest/reference/activity#list-public-events
  static Future<List<EventsModel>> getPublicEvents(String user,
      {bool refresh = false, int perPage, int page}) async {
    Map<String, dynamic> parameters = {'per_page': perPage, 'page': page};
    Response response = await GetDio.getDio().get('/events',
        queryParameters: parameters, options: CacheManager.events(refresh));
    // Todo: Change this.
    List unParsedEvents = response.data;
    List<EventsModel> parsedEvents = [];
    for (var event in unParsedEvents) {
      parsedEvents.add(EventsModel.fromJson(event));
    }
    return parsedEvents;
  }
}
