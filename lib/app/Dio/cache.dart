import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';

class CacheManager {
  static Options notifications({bool refresh = false}) =>
      buildCacheOptions(Duration(days: 7),
          maxStale: Duration(seconds: 5), forceRefresh: refresh);

  static Options currentUserProfileInfo({bool refresh = false}) =>
      buildCacheOptions(Duration(days: 7),
          maxStale: Duration(seconds: 15), forceRefresh: refresh);

  static Options userProfileInfo({bool refresh = false}) =>
      buildCacheOptions(Duration(days: 7),
          maxStale: Duration(seconds: 20), forceRefresh: refresh);

  static Options search({bool refresh = false}) =>
      buildCacheOptions(Duration(days: 7),
          maxStale: Duration(seconds: 20), forceRefresh: refresh);
}
