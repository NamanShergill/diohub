import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_hub/app/global.dart';

class CacheManager {
  static CustomCacheOptions notifications({bool refresh = false}) =>
      CustomCacheOptions(
          refresh: refresh,
          // Have to set it to [CachePolicy.refresh] to ignore 304 error because
          // GitHub always sends a 304 on the notifications for some reason.
          cachePolicy: CachePolicy.refresh);

  static CustomCacheOptions currentUserProfileInfo({bool refresh = false}) =>
      CustomCacheOptions(refresh: refresh);

  static CustomCacheOptions userProfileInfo({bool refresh = false}) =>
      CustomCacheOptions(refresh: refresh);

  static CustomCacheOptions repositories({bool refresh = false}) =>
      CustomCacheOptions(refresh: refresh);

  static CustomCacheOptions search({bool refresh = false}) =>
      CustomCacheOptions(
          refresh: refresh, cachePolicy: CachePolicy.refreshForceCache);

  static CustomCacheOptions events({bool refresh = false}) =>
      CustomCacheOptions(refresh: refresh);

  static CustomCacheOptions reactions() => CustomCacheOptions(refresh: true);

  static CustomCacheOptions defaultCache(
          {bool refresh = false,
          Duration maxAge = const Duration(minutes: 10)}) =>
      CustomCacheOptions(refresh: refresh, maxAge: maxAge);

  static CustomCacheOptions defaultGQLCache(
          {bool refresh = false, Duration maxAge = _maxAge}) =>
      CustomCacheOptions(
        refresh: refresh,
        allowPostMethod: true,
        maxAge: maxAge,
        cachePolicy: CachePolicy.refreshForceCache,
        keyBuilder: (request) {
          return request.data.toString();
        },
      );

  static void clearCache() async {
    await cacheStore.clean();
  }
}

const Duration _maxAge = Duration(minutes: 3);

class CustomCacheOptions extends CacheOptions {
  CustomCacheOptions({
    required this.refresh,
    this.maxAge = _maxAge,
    List<int> hitCacheOnErrorExcept = const [401, 403],
    CacheKeyBuilder keyBuilder = CacheOptions.defaultCacheKeyBuilder,
    Duration maxStale = const Duration(days: 7),
    CachePriority priority = CachePriority.normal,
    bool allowPostMethod = false,
    CachePolicy cachePolicy = CachePolicy.request,
  }) : super(
            store: cacheStore,
            policy: refresh ? CachePolicy.refresh : cachePolicy,
            hitCacheOnErrorExcept: hitCacheOnErrorExcept,
            keyBuilder: keyBuilder,
            maxStale: maxStale,
            allowPostMethod: allowPostMethod,
            priority: priority);
  final Duration maxAge;
  final bool refresh;
}
