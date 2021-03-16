import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';

class CacheManager {
  static Options notifications({bool refresh = false, Options options}) =>
      buildCacheOptions(Duration(minutes: 15),
          maxStale: Duration(days: 7), forceRefresh: refresh, options: options);

  static Options currentUserProfileInfo(
          {bool refresh = false, Options options}) =>
      buildCacheOptions(Duration(minutes: 15),
          maxStale: Duration(days: 7), forceRefresh: refresh, options: options);

  static Options userProfileInfo({bool refresh = false, Options options}) =>
      buildCacheOptions(Duration(days: 7),
          maxStale: Duration(days: 7), forceRefresh: refresh, options: options);

  static Options repositories({bool refresh = false, Options options}) =>
      buildCacheOptions(Duration(minutes: 15),
          maxStale: Duration(days: 7), forceRefresh: refresh, options: options);

  static Options search({bool refresh = false, Options options}) =>
      buildCacheOptions(Duration(days: 7),
          maxStale: Duration(days: 7), forceRefresh: refresh, options: options);

  static Options events({bool refresh = false, Options options}) =>
      buildCacheOptions(Duration(minutes: 15),
          maxStale: Duration(days: 7), forceRefresh: refresh, options: options);

  static Options defaultCache({bool refresh = false, Options options}) =>
      buildCacheOptions(Duration(minutes: 15),
          maxStale: Duration(days: 7), forceRefresh: refresh, options: options);

  static void clearCache() async {
    await DioCacheManager(CacheConfig()).clearAll();
  }
}
