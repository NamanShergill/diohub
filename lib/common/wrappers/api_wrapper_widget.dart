import 'dart:async';
import 'dart:developer';

import 'package:animations/animations.dart';
import 'package:dio/dio.dart';
import 'package:diohub/adapters/internet_connectivity.dart';
import 'package:diohub/common/misc/button.dart';
import 'package:diohub/common/misc/loading_indicator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

typedef ResponseBuilder<T> = Widget Function(
  BuildContext context,
  APISnapshot<T> snapshot,
);
typedef ErrorBuilder = Widget Function(BuildContext context, Object? error);
typedef APICall<T> = Future<T> Function({required bool refresh});
typedef DeferredBuilder<T> = Widget Function(BuildContext context, T data);

class APIWrapper<T> extends StatefulWidget {
  const APIWrapper({
    required this.apiCall,
    required this.builder,
    super.key,
    this.initialData,
  });
  APIWrapper.deferred({
    required this.apiCall,
    required final DeferredBuilder<T> builder,
    final DeferredBuilder<Object?>? errorBuilder,
    final WidgetBuilder? loadingBuilder,
    super.key,
    this.initialData,
  }) : builder = deferredBuilder(
          builder: builder,
          errorBuilder: errorBuilder,
          loadingBuilder: loadingBuilder,
        );

  static ResponseBuilder<T> emptyDeferredBuilder<T>({
    required final DeferredBuilder<T> builder,
    final DeferredBuilder<Object?>? errorBuilder,
    final WidgetBuilder? loadingBuilder,
  }) =>
      deferredBuilder(
        builder: builder,
        loadingBuilder:
            loadingBuilder ?? (final BuildContext context) => Container(),
        errorBuilder: errorBuilder ??
            (final BuildContext context, final Object? error) => Container(),
      );

  static ResponseBuilder<T> deferredBuilder<T>({
    required final DeferredBuilder<T> builder,
    final DeferredBuilder<Object?>? errorBuilder,
    final WidgetBuilder? loadingBuilder,
  }) =>
      (final BuildContext context, final APISnapshot<T> snapshot) =>
          PageTransitionSwitcher(
            transitionBuilder: (
              final Widget child,
              final Animation<double> primaryAnimation,
              final Animation<double> secondaryAnimation,
            ) =>
                FadeThroughTransition(
              animation: primaryAnimation,
              secondaryAnimation: secondaryAnimation,
              fillColor: Colors.transparent,
              child: child,
            ),
            child: snapshot.on(
              loaded: (final APISnapshotLoaded<T> snapshot) =>
                  builder.call(context, snapshot.data),
              loading: (final APISnapshotLoading<T> snapshot) =>
                  loadingBuilder?.call(context) ?? const LoadingIndicator(),
              error: (final APISnapshotError<T> snapshot) =>
                  errorBuilder?.call(context, snapshot.error) ??
                  snapshot.defaultErrorWidget(),
            ),
          );

  final APICall<T> apiCall;
  final ResponseBuilder<T> builder;
  final T? initialData;

  @override
  APIWrapperState<T> createState() => APIWrapperState<T>();
}

class APIWrapperState<T> extends State<APIWrapper<T>> {
  late APISnapshot<T> _snapshot;
  Future<void> setupWidget() async {
    if (widget.initialData == null) {
      await refreshData(forceRefresh: false);
    } else {
      updateSnapshot(
        APISnapshotLoaded<T>(
          widget.initialData as T,
          onRefresh: refreshData,
        ),
      );
    }
  }

  void updateSnapshot(final APISnapshot<T> newSnapshot) {
    setState(() {
      _snapshot = newSnapshot;
    });
  }

  Future<void> refreshData({final bool forceRefresh = true}) async {
    try {
      updateSnapshot(
        APISnapshotLoading<T>(
          // widget.initialData as T,
          onRefresh: refreshData,
        ),
      );
      final T data = await widget.apiCall(refresh: forceRefresh);

      if (mounted) {
        updateSnapshot(
          APISnapshotLoaded<T>(
            data,
            onRefresh: refreshData,
          ),
        );
      }
    } on Exception catch (e) {
      log('API Snapshot Error', error: e);
      updateSnapshot(
        APISnapshotError<T>(
          e,
          onRefresh: refreshData,
        ),
      );
    } on Error catch (e) {
      Logger().e('erorr', error: e, stackTrace: e.stackTrace);
      rethrow;
    }
  }

  void changeData(final T data) {
    updateSnapshot(
      APISnapshotLoaded<T>(
        data,
        onRefresh: refreshData,
      ),
    );
  }

  @override
  void initState() {
    // widget.apiWrapperController?.refresh = fetchData;
    // widget.apiWrapperController?.overrideData = changeData;
    unawaited(setupWidget());
    InternetConnectivity.networkStream
        .listen((final NetworkStatus event) async {
      switch (event) {
        case NetworkStatus.online:
        case NetworkStatus.restored:
          if (_snapshot is APISnapshotError) {
            await refreshData();
          }
        case NetworkStatus.offline:
      }
    });
    super.initState();
  }

  @override
  Widget build(final BuildContext context) => widget.builder.call(
        context,
        _snapshot,
      );
}

class PullToRefreshWrapper<T> extends StatelessWidget {
  const PullToRefreshWrapper({
    required this.wrapperKey,
    required this.child,
    super.key,
  });
  final GlobalKey<APIWrapperState<T>> wrapperKey;
  final Widget child;

  @override
  Widget build(final BuildContext context) => RefreshIndicator(
        onRefresh: () => Future<void>.sync(() async {
          await wrapperKey.currentState?.refreshData();
        }),
        triggerMode: RefreshIndicatorTriggerMode.anywhere,
        child: child,
      );
}

sealed class APISnapshot<T> {
  APISnapshot({
    required final VoidCallback onRefresh,
  }) : _onRefresh = onRefresh;

  final VoidCallback _onRefresh;

  void refresh() {
    _onRefresh.call();
  }

  R on<R>({
    required final R Function(APISnapshotLoaded<T> snapshot) loaded,
    required final R Function(APISnapshotLoading<T> snapshot) loading,
    required final R Function(APISnapshotError<T> snapshot) error,
  }) =>
      switch (this) {
        final APISnapshotLoading<T> item => loading.call(item),
        final APISnapshotError<T> item => error.call(
            item,
          ),
        final APISnapshotLoaded<T> item => loaded.call(
            item,
          ),
      };
}

class APISnapshotLoaded<T> extends APISnapshot<T> {
  APISnapshotLoaded(this.data, {required super.onRefresh});
  final T data;
}

class APISnapshotLoading<T> extends APISnapshot<T> {
  APISnapshotLoading({required super.onRefresh});
}

class APISnapshotError<T> extends APISnapshot<T> {
  APISnapshotError(this.error, {required super.onRefresh});
  final Object? error;

  Widget defaultErrorWidget() => Column(
        children: <Widget>[
          Builder(
            builder: (final BuildContext context) {
              final Object? error = this.error;
              if (error is DioException) {
                if (error.type == DioExceptionType.badResponse) {
                  return Padding(
                    padding: const EdgeInsets.all(24),
                    child: Text(
                      '${error.response!.statusCode}. ${error.response!.statusMessage}.',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  );
                } else if (error.type == DioExceptionType.unknown) {
                  return Padding(
                    padding: const EdgeInsets.all(24),
                    child: Text(
                      error.message ?? 'Something went wrong.',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  );
                }
              }
              return Padding(
                padding: const EdgeInsets.all(24),
                child: Text(
                  kReleaseMode ? 'Something went wrong.' : error.toString(),
                ),
              );
            },
          ),
          Button(
            onTap: refresh,
            child: const Text('Retry'),
          ),
        ],
      );
}
