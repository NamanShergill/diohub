import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter/material.dart';
import 'package:onehub/app/Dio/response_handler.dart';
import 'package:onehub/controller/button/button_controller.dart';
import 'package:onehub/services/authentication/auth_service.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class GetDio {
  static Dio getDio(
      {loggedIn = true,
      checkCache = true,
      baseURL = "https://api.github.com",
      bool debugLog = true,
      bool buttonLock = true}) {
    if (buttonLock) ButtonController.setButtonValue(true);
    Dio dio = Dio();
    dio.interceptors
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
            debugPrint(error);
          }
          return options;
        }
      }, onResponse: (Response response) async {
        if (buttonLock) ButtonController.setButtonValue(false);
        if (response.data.runtimeType.toString().contains('Map')) {
          Map result = response.data;

          if (result.containsKey("message")) {
            ResponseHandler.setSuccessMessage(result["message"]);
          }
        }
        return response;
      }, onError: (DioError error) async {
        if (buttonLock) ButtonController.setButtonValue(false);
        if (error.response.data.runtimeType.toString() == "String") {
          ResponseHandler.setErrorMessage(error.response.data);
          return error.response;
        }
        return error.response;
      }))
      ..add(DioCacheManager(CacheConfig(baseUrl: 'https://api.github.com'))
          .interceptor);
    if (debugLog)
      dio.interceptors
          .add(PrettyDioLogger(requestHeader: true, requestBody: true));
    return dio;
  }
}
