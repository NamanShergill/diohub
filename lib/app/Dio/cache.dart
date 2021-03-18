import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:onehub/app/global.dart';

class CacheManager {
  static CustomCacheOptions notifications({bool refresh = false}) =>
      CustomCacheOptions(refresh);

  static CustomCacheOptions currentUserProfileInfo({bool refresh = false}) =>
      CustomCacheOptions(refresh);

  static CustomCacheOptions userProfileInfo({bool refresh = false}) =>
      CustomCacheOptions(refresh);

  static CustomCacheOptions repositories({bool refresh = false}) =>
      CustomCacheOptions(refresh);

  static CustomCacheOptions search({bool refresh = false}) =>
      CustomCacheOptions(refresh);

  static CustomCacheOptions events({bool refresh = false}) =>
      CustomCacheOptions(refresh);

  static CustomCacheOptions reactions() => CustomCacheOptions(true);

  static CustomCacheOptions defaultCache({bool refresh = false}) =>
      CustomCacheOptions(refresh);

  static void clearCache() async {
    await DbCacheStore(databasePath: Global.directoryPath!).clean();
  }
}

class CustomCacheOptions extends CacheOptions {
  final Duration maxAge;
  final bool refresh;
  CustomCacheOptions(
    this.refresh, {
    this.maxAge = const Duration(minutes: 15),
    CachePolicy policy = CachePolicy.request,
    List<int> hitCacheOnErrorExcept = const [401, 403],
    CacheKeyBuilder keyBuilder = CacheOptions.defaultCacheKeyBuilder,
    Duration maxStale = const Duration(days: 7),
    CachePriority priority = CachePriority.normal,
  }) : super(
            store: Global.cacheStore,
            policy: refresh ? CachePolicy.refresh : policy,
            hitCacheOnErrorExcept: hitCacheOnErrorExcept,
            keyBuilder: keyBuilder,
            maxStale: maxStale,
            priority: priority);
}
