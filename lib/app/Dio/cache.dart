import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';

class CacheManager {
  static CacheOptions notifications({bool refresh = false}) =>
      _template(refresh);

  static CacheOptions currentUserProfileInfo({bool refresh = false}) =>
      _template(refresh);

  static CacheOptions userProfileInfo({bool refresh = false}) =>
      _template(refresh);

  static CacheOptions repositories({bool refresh = false}) =>
      _template(refresh);

  static CacheOptions search({bool refresh = false}) => _template(refresh);

  static CacheOptions events({bool refresh = false}) => _template(refresh);

  static CacheOptions defaultCache({bool refresh = false}) =>
      _template(refresh);

  static void clearCache() async {
    await DbCacheStore().clean();
  }

  static CacheOptions _template(
    bool refresh, {
    CachePolicy policy = CachePolicy.request,
    List<int> exceptions = const [401, 403],
    CachePriority priority = CachePriority.normal,
    Duration maxStale = const Duration(days: 7),
  }) =>
      CacheOptions(
        store: DbCacheStore(),
        policy: refresh ? CachePolicy.refresh : policy,
        hitCacheOnErrorExcept: exceptions,
        priority: priority,
        maxStale: maxStale,
      );
}
