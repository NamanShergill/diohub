import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_hub/app/global.dart';

class CacheManager {
  static CustomCacheOptions notifications({bool refresh = false}) =>
      CustomCacheOptions(refresh,
          // Have to set it to [CachePolicy.refresh] to ignore 304 error because
          // GitHub always sends a 304 on the notifications for some reason.
          cachePolicy: CachePolicy.refresh);

  static CustomCacheOptions currentUserProfileInfo({bool refresh = false}) =>
      CustomCacheOptions(refresh);

  static CustomCacheOptions userProfileInfo({bool refresh = false}) =>
      CustomCacheOptions(refresh);

  static CustomCacheOptions repositories({bool refresh = false}) =>
      CustomCacheOptions(refresh);

  static CustomCacheOptions search({bool refresh = false}) =>
      CustomCacheOptions(refresh, cachePolicy: CachePolicy.refreshForceCache);

  static CustomCacheOptions events({bool refresh = false}) =>
      CustomCacheOptions(refresh);

  static CustomCacheOptions reactions() => CustomCacheOptions(true);

  static CustomCacheOptions defaultCache({bool refresh = false}) =>
      CustomCacheOptions(refresh);

  static void clearCache() async {
    await Global.cacheStore.clean();
  }
}

class CustomCacheOptions extends CacheOptions {
  final Duration maxAge;
  final bool refresh;
  CustomCacheOptions(
    this.refresh, {
    this.maxAge = const Duration(minutes: 10),
    List<int> hitCacheOnErrorExcept = const [401, 403],
    CacheKeyBuilder keyBuilder = CacheOptions.defaultCacheKeyBuilder,
    Duration maxStale = const Duration(days: 7),
    CachePriority priority = CachePriority.normal,
    CachePolicy cachePolicy = CachePolicy.request,
  }) : super(
            store: Global.cacheStore,
            policy: refresh ? CachePolicy.refresh : cachePolicy,
            hitCacheOnErrorExcept: hitCacheOnErrorExcept,
            keyBuilder: keyBuilder,
            maxStale: maxStale,
            priority: priority);
}
