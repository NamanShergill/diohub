import 'package:dio/dio.dart';
import 'package:onehub/app/Dio/cache.dart';
import 'package:onehub/app/Dio/dio.dart';
import 'package:onehub/models/events/events_model.dart';

class EventsService {
  static Future<Response> getUserEvents(String user) async {
    Response response =
        await GetDio.getDio().get('/users/$user/events').then((value) {
      return value;
    });
    return response;
  }

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
}
