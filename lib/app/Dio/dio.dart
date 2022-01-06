import 'package:artemis/artemis.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_hub/app/Dio/cache.dart';
import 'package:dio_hub/app/Dio/response_handler.dart';
import 'package:dio_hub/app/global.dart';
import 'package:dio_hub/controller/button/button_controller.dart';
import 'package:dio_hub/models/popup/popup_type.dart';
import 'package:dio_hub/services/authentication/auth_service.dart';
import 'package:flutter/foundation.dart';
import 'package:gql_dio_link/gql_dio_link.dart';
import 'package:gql_exec/gql_exec.dart' as gql_exec;
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

typedef GQLResponse = gql_exec.Response;

Dio request({
  bool loggedIn = true,
  bool cacheEnabled = true,
  String baseURL = apiBaseURL,
  bool applyBaseURL = true,
  bool loginRequired = true,
  bool debugLog = false,
  bool buttonLock = true,
  bool showPopup = true,
  String? acceptHeader,
  CustomCacheOptions? cacheOptions,
}) {
  // Makes the buttons listening to this stream get disabled to prevent
  // multiple taps.
  if (buttonLock) {
    setButtonValue(value: true);
  }
  final dio = Dio();

  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) async {
        if (applyBaseURL) {
          options.baseUrl = baseURL;
        }
        options.headers['Accept'] = acceptHeader ?? 'application/json';
        options.headers['setContentType'] = 'application/json';
        options.headers['User-Agent'] = 'com.felix.diohub';
        if (loggedIn == false) {
          if (loginRequired) {
            throw Exception('Not authenticated.');
          }
        } else {
          // Queue the request to add necessary headers before executing.
          dio.interceptors.requestLock.lock();
          try {
            AuthService.getAccessTokenFromDevice().then((token) async {
              // Throw error if request requires login and no token is found
              // on device.
              if (token == null && loginRequired) {
                throw Exception('Not authenticated.');
              }
              // Add auth token to header.
              options.headers['Authorization'] = 'token $token';
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
          final key = cacheOptions?.allowPostMethod == true
              ? generateUUIDFromRequest(options)
              : CacheOptions.defaultCacheKeyBuilder(options);
          final cache = await cacheStore.get(key);
          if (cache != null &&
              cacheOptions != null &&
              !cacheOptions.refresh &&
              DateTime.now()
                  .isBefore(cache.responseDate.add(cacheOptions.maxAge))) {
            if (buttonLock) {
              setButtonValue(value: false);
            }
            // Resolve the request and pass cached data as response.
            return handler.resolve(cache.toResponse(options, fromNetwork: false)
              ..statusCode = cacheOptions.allowPostMethod == true ? 200 : 304);
          }
        }
        // Proceed with the request.
        handler.next(options);
      },
      onResponse: (response, handler) async {
        // Makes the buttons listening to this stream get enabled again.
        if (buttonLock) {
          setButtonValue(value: false);
        }
        // If response contains a ['message'] key, show success popup to the
        // user with the message.
        if (response.data.runtimeType is Map &&
            response.data.containsKey('message') &&
            showPopup) {
          ResponseHandler.setSuccessMessage(
              AppPopupData(title: response.data['message']));
        }
        handler.next(response);
      },
      onError: (error, handler) async {
        // Global.log.e(error.toString());
        // Makes the buttons listening to this stream get enabled again.

        if (buttonLock) {
          setButtonValue(value: false);
        }

        // Todo: Add better exception handling based on response codes.
        if (error.response == null) {
          handler.next(error);
        } else if (error.response?.data.runtimeType is Map &&
            error.response?.data.containsKey('message') &&
            showPopup) {
          ResponseHandler.setErrorMessage(
              AppPopupData(title: error.response!.data['message']));
        }
        handler.next(error);
      },
    ),
  );
  // If [cacheEnabled] is true, check the cache/cache the response.
  if (cacheEnabled) {
    dio.interceptors.add(
      DioCacheInterceptor(
          options: cacheOptions ??
              CacheOptions(policy: CachePolicy.refresh, store: cacheStore)),
    );
  }
  // Log the request in the console for debugging if [debugLog] is true.
  if (debugLog && !kReleaseMode) {
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true, requestBody: true, responseHeader: true));
  }
  return dio;
}

Future<GQLResponse> gqlRequest(
  GraphQLQuery query, {
  bool loggedIn = true,
  bool cacheEnabled = true,
  bool applyBaseURL = true,
  bool loginRequired = true,
  bool debugLog = kReleaseMode,
  bool buttonLock = true,
  bool showPopup = true,
  String? acceptHeader,
  CustomCacheOptions? cacheOptions,
}) async {
  return DioLink(
    '$apiBaseURL/graphql',
    client: request(
        loggedIn: loggedIn,
        baseURL: '$apiBaseURL/graphql',
        acceptHeader: acceptHeader,
        debugLog: debugLog,
        applyBaseURL: applyBaseURL,
        buttonLock: buttonLock,
        cacheEnabled: cacheEnabled,
        cacheOptions: cacheOptions,
        loginRequired: loginRequired,
        showPopup: showPopup),
  )
      .request(gql_exec.Request(
        operation: gql_exec.Operation(document: query.document),
        variables: query.variables!.toJson(),
      ))
      .first;
}
