import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dio_hub/common/misc/loading_indicator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

typedef ResponseBuilder<T> = Widget Function(
    BuildContext context, APISnapshot<T> snapshot);
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

  static ResponseBuilder<T> deferredBuilder<T>({
    required final DeferredBuilder<T> builder,
    final DeferredBuilder<Object?>? errorBuilder,
    final WidgetBuilder? loadingBuilder,
  }) =>
      (final BuildContext context, final APISnapshot<T> snapshot) =>
          switch (snapshot) {
            APISnapshotLoaded<T>() => builder.call(context, snapshot.data),
            APISnapshotLoading<T>() =>
              loadingBuilder?.call(context) ?? const LoadingIndicator(),
            APISnapshotError<T>() =>
              errorBuilder?.call(context, snapshot.error) ??
                  _buildError(snapshot.error),
          };

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
      _snapshot = APISnapshotLoaded<T>(
        widget.initialData as T,
        onRefresh: refreshData,
      );
    }
  }

  Future<void> refreshData({final bool forceRefresh = true}) async {
    try {
      _snapshot = APISnapshotLoading<T>(
        // widget.initialData as T,
        onRefresh: refreshData,
      );
      final T data = await widget.apiCall(refresh: forceRefresh);

      if (mounted) {
        setState(() {
          _snapshot = APISnapshotLoaded<T>(
            data,
            onRefresh: refreshData,
          );
        });
      }
    } on Exception catch (e) {
      log('API Snapshot Error', error: e);
      _snapshot = APISnapshotError<T>(
        e,
        onRefresh: refreshData,
      );
    }
  }

  void changeData(final T data) {
    setState(() {
      _snapshot = APISnapshotLoaded<T>(data, onRefresh: refreshData);
    });
  }

  @override
  void initState() {
    // widget.apiWrapperController?.refresh = fetchData;
    // widget.apiWrapperController?.overrideData = changeData;
    unawaited(setupWidget());
    super.initState();
  }

  @override
  Widget build(final BuildContext context) => widget.builder.call(
        context,
        _snapshot,
      );
}

Builder _buildError(final Object? error) => Builder(
      builder: (final BuildContext context) {
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
    );

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
}
