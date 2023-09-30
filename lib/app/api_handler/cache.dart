part of 'dio.dart';

class CacheManager {
  static APICache defaultGQLCache({
    final bool refresh = false,
    final Duration maxAge = _maxAge,
  }) =>
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
    final List<int>? hitCacheOnErrorExcept = const <int>[401, 403],
    final CacheKeyBuilder keyBuilder = CacheOptions.defaultCacheKeyBuilder,
    final Duration maxStale = const Duration(days: 7),
    final CachePriority priority = CachePriority.normal,
    final bool allowPostMethod = false,
    final CachePolicy cachePolicy = CachePolicy.request,
  }) : cacheOptions = CacheOptions(
          store: BaseAPIHandler._cacheStore,
          policy: cachePolicy,
          hitCacheOnErrorExcept: hitCacheOnErrorExcept,
          keyBuilder: keyBuilder,
          maxStale: maxStale,
          allowPostMethod: allowPostMethod,
          priority: priority,
        );

  APICache._copyWith({
    required this.cacheOptions,
    this.maxAge,
  });

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

  APICache copyWith({
    final Duration? maxAge,
    final Nullable<List<int>>? hitCacheOnErrorExcept,
    final CacheKeyBuilder? keyBuilder,
    final Nullable<Duration>? maxStale,
    final CachePriority? priority,
    final bool? allowPostMethod,
    final CachePolicy? cachePolicy = CachePolicy.request,
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

String generateUUIDFromRequest(final RequestOptions options) => const Uuid().v5(
      Uuid.NAMESPACE_URL,
      options.data.toString(),
    );
