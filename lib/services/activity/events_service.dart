import 'package:dio/dio.dart';
import 'package:gitapp/app/Dio/dio.dart';

class EventsService {
  Future<Response> getUserEvents(String user) async {
    Response response =
        await GetDio.getDio().get('/users/$user/events').then((value) {
      print(value);
      return value;
    });
    return response;
  }
}
