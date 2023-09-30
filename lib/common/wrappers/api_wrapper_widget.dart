import 'dart:async';

import 'package:dio/dio.dart';
import 'package:dio_hub/common/animations/fade_animation_widget.dart';
import 'package:dio_hub/common/misc/loading_indicator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class APIWrapperController<T> {
  late void Function() refresh;
  late void Function(T data) changeData;
}

typedef ResponseBuilder<T> = Widget Function(BuildContext context, T data);
typedef ErrorBuilder = Widget Function(BuildContext context, Object? error);
typedef APICall<T> = Future<T> Function({required bool refresh});

class APIWrapper<T> extends StatefulWidget {
  const APIWrapper({
    required this.apiCall,
    required this.responseBuilder,
    super.key,
    this.fadeIntoView = true,
    this.apiWrapperController,
    this.initialData,
    this.errorBuilder,
    this.loadingBuilder,
  });
  final APICall<T> apiCall;
  final ResponseBuilder<T> responseBuilder;
  final WidgetBuilder? loadingBuilder;
  final ErrorBuilder? errorBuilder;
  final T? initialData;
  final APIWrapperController<T>? apiWrapperController;
  final bool fadeIntoView;

  @override
  APIWrapperState<T> createState() => APIWrapperState<T>();
}

class APIWrapperState<T> extends State<APIWrapper<T>> {
  late T data;
  bool loading = true;
  Object? error;

  Future<void> setupWidget() async {
    if (widget.initialData == null) {
      await fetchData(refresh: false);
    } else {
      data = widget.initialData as T;
      if (mounted) {
        setState(() {
          loading = false;
        });
      }
    }
  }

  Future<void> fetchData({final bool refresh = true}) async {
    if (mounted) {
      setState(() {
        loading = true;
      });
    }
    try {
      error = null;
      data = await widget.apiCall(refresh: refresh);
      if (mounted) {
        setState(() {});
      }
    } catch (e) {
      debugPrint(e.toString());
      error = e;
    }
    if (mounted) {
      setState(() {
        loading = false;
      });
    }
  }

  void changeData(final T data) {
    setState(() {
      this.data = data;
    });
  }

  @override
  void initState() {
    widget.apiWrapperController?.refresh = fetchData;
    widget.apiWrapperController?.changeData = changeData;
    unawaited(setupWidget());
    super.initState();
  }

  @override
  Widget build(final BuildContext context) {
    if (loading) {
      return widget.loadingBuilder != null
          ? widget.loadingBuilder!(context)
          : const LoadingIndicator();
    } else if (error != null) {
      return widget.errorBuilder != null
          ? widget.errorBuilder!(context, error)
          // : Text(error!);
          : Builder(
              builder: (final BuildContext context) {
                if (error is DioException) {
                  final DioException err = error! as DioException;
                  if (err.type == DioExceptionType.badResponse) {
                    return Padding(
                      padding: const EdgeInsets.all(24),
                      child: Text(
                        '${err.response!.statusCode}. ${err.response!.statusMessage}.',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    );
                  } else if (err.type == DioExceptionType.unknown) {
                    return Padding(
                      padding: const EdgeInsets.all(24),
                      child: Text(
                        err.message ?? 'Something went wrong.',
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
    }

    if (widget.fadeIntoView) {
      return FadeAnimationSection(
        child: widget.responseBuilder(context, data),
      );
    }
    return widget.responseBuilder(context, data);
  }
}

class PullToRefreshWrapper<T> extends StatelessWidget {
  const PullToRefreshWrapper({
    required this.apiWrapperController,
    required this.child,
    super.key,
  });
  final APIWrapperController<T> apiWrapperController;
  final Widget child;

  @override
  Widget build(final BuildContext context) => RefreshIndicator(
        onRefresh: () => Future<void>.sync(() async {
          apiWrapperController.refresh();
        }),
        triggerMode: RefreshIndicatorTriggerMode.anywhere,
        child: child,
      );
}
