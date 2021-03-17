import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:onehub/app/Dio/response_handler.dart';
import 'package:onehub/app/global.dart';
import 'package:onehub/controller/button/button_controller.dart';
import 'package:onehub/models/popup/popup_type.dart';
import 'package:onehub/services/authentication/auth_service.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class GetDio {
  static Dio getDio({
    bool loggedIn = true,
    bool cacheEnabled = true,
    String baseURL = Global.apiBaseURL,
    bool applyBaseURL = true,
    bool loginRequired = true,
    bool debugLog = false,
    bool buttonLock = true,
    bool showPopup = true,
    String acceptHeader,
    CacheOptions options,
  }) {
    // Makes the buttons listening to this stream get disabled to prevent multiple taps.
    if (buttonLock) ButtonController.setButtonValue(true);
    Dio dio = Dio();

    dio.interceptors
      ..add(InterceptorsWrapper(onRequest:
          (RequestOptions optionss, RequestInterceptorHandler handler) async {
        // If [cacheEnabled] is true, check the cache/cache the response.
        if (cacheEnabled)
          dio.interceptors.add(
            DioCacheInterceptor(
                options: CacheOptions(
                    policy: CachePolicy.refresh, store: MemCacheStore())),
          );
        if (applyBaseURL) optionss.baseUrl = baseURL;
        optionss.headers["Accept"] = acceptHeader ?? "application/json";
        optionss.headers["setContentType"] = "application/json";
        if (loggedIn == false) {
          if (loginRequired) throw Exception('Not authenticated.');
        } else {
          // Queue the request to add necessary headers before executing.
          dio.interceptors.requestLock.lock();
          try {
            AuthService.getAccessTokenFromDevice().then((token) async {
              // Throw error if request requires login and no token is found on device.
              if (token == null && loginRequired) {
                throw Exception('Not authenticated.');
              }
              // Add auth token to header.
              optionss.headers["Authorization"] = "token $token";
            }).whenComplete(() {
              // Execute the request and return the necessary headers.
              dio.interceptors.requestLock.unlock();
              return optionss;
            });
          } catch (error) {
            debugPrint(error);
          }

          return optionss;
        }
      }, onResponse:
          (Response response, ResponseInterceptorHandler handler) async {
        // Makes the buttons listening to this stream get enabled again.
        if (buttonLock) ButtonController.setButtonValue(false);
        // If response contains a ['message'] key, show success popup to the user with the message.
        if (response.data.runtimeType.toString().contains('Map')) {
          if (response.data.containsKey("message") && showPopup) {
            ResponseHandler.setSuccessMessage(
                AppPopupData(title: response.data["message"]));
          }
        }
        return response;
      }, onError: (DioError error, ErrorInterceptorHandler handler) async {
        Global.log.e(error.response.data);

        // Makes the buttons listening to this stream get enabled again.
        if (buttonLock) ButtonController.setButtonValue(false);

        // Todo: Add better exception handling based on response codes.
        if (error.response == null) {
          throw Exception(error.message ?? 'Some error occurred.');
        }
        // If response contains a ['message'] key, show error popup to the user with the message.
        else if (error.response.data.containsKey("message") && showPopup) {
          ResponseHandler.setErrorMessage(
              AppPopupData(title: error.response.data['message']));
        }
      }));

    // Log the request in the console for debugging if [debugLog] is true.
    if (true)
      dio.interceptors
          .add(PrettyDioLogger(requestHeader: true, requestBody: true));
    // dio.interceptors.add(PrettyDioLogger(
    //   responseHeader: true,
    //   responseBody: false,
    //   requestBody: true,
    //   requestHeader: true,
    // ));
    return dio;
  }
}
