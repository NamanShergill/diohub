part of 'dio.dart';

class CacheManager {
  static APICache defaultGQLCache(
          {bool refresh = false, Duration maxAge = _maxAge}) =>
      APICache(
        allowPostMethod: true,
        maxAge: maxAge,
        cachePolicy: CachePolicy.refreshForceCache,
        keyBuilder: generateUUIDFromRequest,
      );
}

const Duration _maxAge = Duration(minutes: 2);

class APICache {
  APICache({
    this.maxAge = _maxAge,
    List<int>? hitCacheOnErrorExcept = const [401, 403],
    CacheKeyBuilder keyBuilder = CacheOptions.defaultCacheKeyBuilder,
    Duration maxStale = const Duration(days: 7),
    CachePriority priority = CachePriority.normal,
    bool allowPostMethod = false,
    CachePolicy cachePolicy = CachePolicy.request,
  }) : cacheOptions = CacheOptions(
            store: BaseAPIHandler._cacheStore,
            policy: cachePolicy,
            hitCacheOnErrorExcept: hitCacheOnErrorExcept,
            keyBuilder: keyBuilder,
            maxStale: maxStale,
            allowPostMethod: allowPostMethod,
            priority: priority);

  APICache.noCache()
      : maxAge = null,
        cacheOptions = CacheOptions(
          store: BaseAPIHandler._cacheStore,
          policy: CachePolicy.noCache,
        );

  APICache.refresh()
      : this(
          cachePolicy: CachePolicy.refresh,
        );
  final Duration? maxAge;
  final CacheOptions cacheOptions;

  APICache._copyWith({
    this.maxAge,
    required this.cacheOptions,
  });

  APICache copyWith({
    Duration? maxAge,
    Nullable<List<int>>? hitCacheOnErrorExcept,
    CacheKeyBuilder? keyBuilder,
    Nullable<Duration>? maxStale,
    CachePriority? priority,
    bool? allowPostMethod,
    CachePolicy? cachePolicy = CachePolicy.request,
  }) =>
      APICache._copyWith(
        cacheOptions: cacheOptions.copyWith(
          keyBuilder: keyBuilder,
          hitCacheOnErrorExcept: hitCacheOnErrorExcept,
          allowPostMethod: allowPostMethod,
          policy: cachePolicy,
          maxStale: maxStale,
          priority: priority,
        ),
        maxAge: maxAge ?? this.maxAge,
      );
}

String generateUUIDFromRequest(RequestOptions options) => const Uuid().v5(
      Uuid.NAMESPACE_URL,
      options.data.toString(),
    );
