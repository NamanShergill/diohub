import 'package:dio/dio.dart';
import 'package:gitapp/app/global.dart';
import 'package:gitapp/controller/button/button_controller.dart';

class GetDio {
  static Dio getDio(
      {loggedIn = true,
      checkCache = true,
      baseURL = "https://api.github.com"}) {
    ButtonController.setButtonValue(true);
    Dio dio = Dio();
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
      options.baseUrl = baseURL;
      options.headers["Accept"] = "application/json";
      options.headers["setContentType"] = "application/json";
      if (loggedIn == false) {
      } else {
        dio.interceptors.requestLock.lock();
        try {
          Global.getAccessToken().then((token) async {
            options.headers["Authorization"] = token;
          }).whenComplete(() {
            dio.interceptors.requestLock.unlock();
            return options;
          });
        } catch (error) {
          print(error);
        }
        return options;
      }
    }, onResponse: (Response response) async {
      ButtonController.setButtonValue(false);
      return response;
    }, onError: (DioError error) async {
      ButtonController.setButtonValue(false);
      return error.response;
    }));
    return dio;
  }
}
