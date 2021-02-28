import 'package:dio/dio.dart';
import 'package:onehub/app/Dio/dio.dart';

class EventsService {
  static Future<Response> getUserEvents(String user) async {
    Response response =
        await GetDio.getDio().get('/users/$user/events').then((value) {
      return value;
    });
    return response;
  }
}
