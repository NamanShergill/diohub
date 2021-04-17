import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:onehub/app/Dio/cache.dart';
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
    bool debugLog = kReleaseMode,
    bool buttonLock = true,
    bool showPopup = true,
    String? acceptHeader,
    CustomCacheOptions? cacheOptions,
  }) {
    // Makes the buttons listening to this stream get disabled to prevent multiple taps.
    if (buttonLock) ButtonController.setButtonValue(true);
    Dio dio = Dio();

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest:
            (RequestOptions options, RequestInterceptorHandler handler) async {
          if (applyBaseURL) options.baseUrl = baseURL;
          options.headers["Accept"] = acceptHeader ?? "application/json";
          options.headers["setContentType"] = "application/json";
          options.headers['User-Agent'] = "com.felix.onehub";
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
                options.headers["Authorization"] = "token $token";
              }).whenComplete(() {
                // Execute the request and return the necessary headers.
                dio.interceptors.requestLock.unlock();
              });
            } catch (error) {
              debugPrint(error.toString());
            }
          }

          // Check cache first and return cached data if supplied maxAge
          // has not elapsed.
          if (cacheEnabled) {
            final key = CacheOptions.defaultCacheKeyBuilder(options);
            final cache = await Global.cacheStore.get(key);
            if (cache != null &&
                cacheOptions != null &&
                !(cacheOptions.refresh) &&
                DateTime.now()
                    .isBefore(cache.responseDate.add(cacheOptions.maxAge))) {
              if (buttonLock) ButtonController.setButtonValue(false);
              // Resolve the request and pass cached data as response.
              return handler
                  .resolve(cache.toResponse(options, fromNetwork: false));
            }
          }
          // Proceed with the request.
          handler.next(options);
        },
        onResponse:
            (Response response, ResponseInterceptorHandler handler) async {
          // Makes the buttons listening to this stream get enabled again.
          if (buttonLock) ButtonController.setButtonValue(false);
          // If response contains a ['message'] key, show success popup to the user with the message.
          if (response.data.runtimeType is Map &&
              response.data.containsKey("message") &&
              showPopup) {
            ResponseHandler.setSuccessMessage(
                AppPopupData(title: response.data["message"]));
          }
          handler.next(response);
        },
        onError: (DioError error, ErrorInterceptorHandler handler) async {
          // Global.log.e(error.toString());
          // Makes the buttons listening to this stream get enabled again.
          if (buttonLock) ButtonController.setButtonValue(false);

          // Todo: Add better exception handling based on response codes.
          if (error.response == null) {
            handler.next(error);
          } else if (error.response?.data.runtimeType is Map &&
              error.response?.data.containsKey("message") &&
              showPopup) {
            ResponseHandler.setErrorMessage(
                AppPopupData(title: error.response!.data['message']));
          }
          handler.next(error);
        },
      ),
    );
    // If [cacheEnabled] is true, check the cache/cache the response.
    if (cacheEnabled)
      dio.interceptors.add(
        DioCacheInterceptor(
            options: cacheOptions ??
                CacheOptions(
                    policy: CachePolicy.refresh, store: Global.cacheStore)),
      );
    // Log the request in the console for debugging if [debugLog] is true.
    if (debugLog)
      dio.interceptors.add(PrettyDioLogger(
          requestHeader: true, requestBody: true, responseHeader: true));
    return dio;
  }
}
