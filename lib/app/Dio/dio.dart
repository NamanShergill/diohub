import 'package:artemis/artemis.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_db_store/dio_cache_interceptor_db_store.dart';
import 'package:dio_hub/app/Dio/response_handler.dart';
import 'package:dio_hub/app/global.dart';
import 'package:dio_hub/models/popup/popup_type.dart';
import 'package:dio_hub/services/authentication/auth_service.dart';
import 'package:gql_dio_link/gql_dio_link.dart';
import 'package:gql_exec/gql_exec.dart' as gql_exec;
import 'package:gql_link/gql_link.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:uuid/uuid.dart';

part 'cache.dart';

typedef GQLResponse = gql_exec.Response;
typedef GQLRequest = gql_exec.Request;
typedef GQLOperation = gql_exec.Operation;

class RESTHandler extends BaseAPIHandler {
  RESTHandler({
    super.apiLogSettings,
    super.cacheOptions,
  }) : super(
          baseURL: apiBaseURL,
        );
  RESTHandler.external({
    super.apiLogSettings,
    super.cacheOptions,
    required super.baseURL,
  }) : super(
          addAuthHeader: false,
        );

  Future<Response> get(
    String url, {
    bool refreshCache = false,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
    Map<String, dynamic>? requestHeaders,
  }) async {
    try {
      final response = await _request(
        requestHeaders: requestHeaders,
        overrideAPICache: activeCacheOptions.copyWith(
          cachePolicy: refreshCache ? CachePolicy.refresh : null,
        ),
      ).get(
        url,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> post(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    Map<String, dynamic>? requestHeaders,
  }) async {
    try {
      final response = await _request(
        requestHeaders: requestHeaders,
      ).post(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> put(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    Map<String, dynamic>? requestHeaders,
  }) async {
    try {
      final response = await _request(
        requestHeaders: requestHeaders,
      ).put(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> delete(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    Map<String, dynamic>? requestHeaders,
  }) async {
    try {
      final response = await _request(
        requestHeaders: requestHeaders,
      ).delete(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> patch(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    Map<String, dynamic>? requestHeaders,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _request(
        requestHeaders: requestHeaders,
      ).patch(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onSendProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}

class GraphqlHandler extends BaseAPIHandler {
  GraphqlHandler({
    super.apiLogSettings,
    super.cacheOptions,
  }) : super(
          baseURL: '$apiBaseURL/graphql',
        );

  Future<GQLResponse> mutation(GraphQLQuery query) {
    return _query(
      query,
      overrideAPICache: APICache.noCache(),
    );
  }

  Future<GQLResponse> query(
    GraphQLQuery query, {
    bool refreshCache = false,
    Map<String, dynamic>? requestHeaders,
  }) async {
    return _query(
      query,
      requestHeaders: requestHeaders,
      overrideAPICache: activeCacheOptions.copyWith(
        cachePolicy: refreshCache ? CachePolicy.refresh : null,
      ),
    );
  }

  @override
  APICache get _defaultCacheOptions => CacheManager.defaultGQLCache();

  Future<GQLResponse> _query(
    GraphQLQuery query, {
    APICache? overrideAPICache,
    Map<String, dynamic>? requestHeaders,
  }) async {
    return DioLink(
      '$apiBaseURL/graphql',
      client: _request(
        overrideAPICache: overrideAPICache,
        requestHeaders: requestHeaders,
      ),
    )
        .request(
          GQLRequest(
            operation: GQLOperation(document: query.document),
            variables: query.variables!.toJson(),
          ),
        )
        .first
        .onError(
      (error, stackTrace) {
        // If data is from cache the header would be 304, hence the value should
        // be returned.
        if (error is DioLinkServerException &&
            error.response.statusCode == 304) {
          final gqlResponse =
              const ResponseParser().parseResponse(error.response.data);
          return GQLResponse(
            data: gqlResponse.data,
            errors: gqlResponse.errors,
            response: gqlResponse.response,
          );
        } else {
          throw error as DioLinkServerException;
        }
      },
      test: (error) => error is DioLinkServerException,
    );
  }
}

abstract class BaseAPIHandler {
  BaseAPIHandler({
    this.cacheOptions,
    this.apiLogSettings,
    this.addAuthHeader = true,
    required this.baseURL,
    this.propagateMessagesToUI = true,
  });

  final bool addAuthHeader;
  final APICache? cacheOptions;
  final String baseURL;
  final bool propagateMessagesToUI;

  APICache get _defaultCacheOptions =>
      APICache(cachePolicy: CachePolicy.request);

  APICache get activeCacheOptions => cacheOptions ?? _defaultCacheOptions;

  final APILoggingSettings? apiLogSettings;

  APILoggingSettings? get defaultAPILogSettings => null;

  Dio _request({
    Map<String, dynamic>? requestHeaders,
    APICache? overrideAPICache,
  }) {
    final cache = overrideAPICache ?? cacheOptions ?? _defaultCacheOptions;

    final dio = Dio();

    if (addAuthHeader) {
      dio.interceptors.add(
        QueuedInterceptorsWrapper(
          onRequest: (options, handler) async {
            try {
              final authRepo = AuthRepository();
              final token = await authRepo.getAccessTokenFromDevice();
              options.headers['Authorization'] = 'token $token';
              handler.next(options);
            } catch (e) {
              log.e('Could not fetch auth token from device.', e);
              handler.reject(
                DioError(requestOptions: options, error: e),
              );
            }
          },
        ),
      );
    }
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          options.baseUrl = baseURL;
          options.headers['Accept'] = 'application/json';
          options.headers['setContentType'] = 'application/json';
          options.headers['User-Agent'] = 'com.felix.diohub';
          if (requestHeaders != null) {
            options.headers.addAll(requestHeaders);
          }
          // Proceed with the request.
          handler.next(options);
        },
        onResponse: (response, handler) async {
          // If response contains a ['message'] key, show success popup to the
          // user with the message.
          if (response.data.runtimeType is Map &&
              response.data.containsKey('message') &&
              propagateMessagesToUI) {
            ResponseHandler.setSuccessMessage(
                AppPopupData(title: response.data['message']));
          }
          handler.next(response);
        },
        onError: (error, handler) async {
          // Todo: Add better exception handling based on response codes.
          if (error.response == null) {
            handler.next(error);
          } else if (error.response?.data.runtimeType is Map &&
              error.response?.data.containsKey('message') &&
              propagateMessagesToUI) {
            ResponseHandler.setErrorMessage(
                AppPopupData(title: error.response!.data['message']));
          }
          handler.next(error);
        },
      ),
    );
    // Check cache first and return cached data if supplied maxAge
    // has not elapsed. Skipped if cacheOptions is null as the default
    // behaviour in that case is to refresh the data.
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          if (requestHeaders != null) {
            options.headers.addAll(requestHeaders);
          }
          final checkCache = cache.cacheOptions.policy != CachePolicy.noCache &&
              cache.cacheOptions.policy != CachePolicy.refresh &&
              cache.maxAge != null;
          if (checkCache) {
            final key = cache.cacheOptions.keyBuilder(options);
            final cacheData = await _cacheStore.get(key);
            print(cacheData);
            if (cacheData != null &&
                DateTime.now()
                    .isBefore(cacheData.responseDate.add(cache.maxAge!))) {
              // Resolve the request and pass cached data as response.
              return handler
                  .resolve(cacheData.toResponse(options, fromNetwork: false));
            }
          }
          handler.next(options);
        },
      ),
    );
    // Add the interceptor to handle caching.
    dio.interceptors.add(
      DioCacheInterceptor(options: cache.cacheOptions),
    );

    // Log the request in the console if `apiLogSettings` is not null.
    final logSettings = apiLogSettings ?? defaultAPILogSettings;
    if (logSettings != null) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: logSettings.requestHeader,
          requestBody: logSettings.requestBody,
          responseHeader: logSettings.responseHeader,
          error: logSettings.error,
          responseBody: logSettings.responseBody,
          compact: logSettings.compact,
          logPrint: logSettings.logPrint,
          maxWidth: logSettings.maxWidth,
          request: logSettings.request,
        ),
      );
    }

    return dio;
  }

  static late final DbCacheStore _cacheStore;

  static Future setupDioAPICache() async {
    String? directoryPath;

    directoryPath = (await getApplicationDocumentsDirectory()).path;
    _cacheStore = DbCacheStore(databasePath: directoryPath);
  }

  static void clearCache() async {
    await _cacheStore.clean();
  }

  Map<String, dynamic> acceptHeader(String header) => {
        'Accept': header,
      };
}

class APILoggingSettings {
  APILoggingSettings(
      {this.request = true,
      this.requestHeader = false,
      this.requestBody = false,
      this.responseHeader = false,
      this.responseBody = true,
      this.error = true,
      this.maxWidth = 90,
      this.compact = true,
      this.logPrint = print});

  APILoggingSettings.comprehensive(
      {this.maxWidth = 90, this.compact = true, this.logPrint = print})
      : request = true,
        requestHeader = true,
        requestBody = true,
        responseHeader = true,
        responseBody = true,
        error = true;

  /// Print request [Options]
  final bool request;

  /// Print request header [Options.headers]
  final bool requestHeader;

  /// Print request data [Options.data]
  final bool requestBody;

  /// Print [Response.data]
  final bool responseBody;

  /// Print [Response.headers]
  final bool responseHeader;

  /// Print error message
  final bool error;

  /// InitialTab count to logPrint json response
  static const int initialTab = 1;

  /// 1 tab length
  static const String tabStep = '    ';

  /// Print compact json response
  final bool compact;

  /// Width size per logPrint
  final int maxWidth;

  /// Log printer; defaults logPrint log to console.
  /// In flutter, you'd better use debugPrint.
  /// you can also write log in a file.
  void Function(Object object) logPrint;
}
