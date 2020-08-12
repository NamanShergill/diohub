import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:gitapp/app/Dio/response_handler.dart';
import 'package:gitapp/controller/button/button_controller.dart';
import 'package:gitapp/services/authentication/auth_service.dart';

class GetDio {
  static Dio getDio(
      {loggedIn = true,
      checkCache = true,
      baseURL = "https://api.github.com"}) {
    ButtonController.setButtonValue(true);
    Dio dio = Dio();
    dio.interceptors
      ..add(DioCacheManager(CacheConfig(baseUrl: 'https://api.github.com'))
          .interceptor)
      ..add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
        options.baseUrl = baseURL;
        options.headers["Accept"] = "application/json";
        options.headers["setContentType"] = "application/json";
        if (loggedIn == false) {
        } else {
          dio.interceptors.requestLock.lock();
          try {
            AuthService.getAccessTokenFromDevice().then((token) async {
              options.headers["Authorization"] = "token $token";
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
        if (response.data.runtimeType.toString().contains('Map')) {
          Map result = response.data;

          if (result.containsKey("message")) {
            ResponseHandler.setSuccessMessage(result["message"]);
          }
        }
        return response;
      }, onError: (DioError error) async {
        ButtonController.setButtonValue(false);
        if (error.response.data.runtimeType.toString() == "String") {
          ResponseHandler.setErrorMessage(error.response.data);
          return error.response;
        }
        return error.response;
      }));
    return dio;
  }
}
