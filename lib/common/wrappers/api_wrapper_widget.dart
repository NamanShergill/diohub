import 'package:dio/dio.dart';
import 'package:dio_hub/common/animations/fade_animation_widget.dart';
import 'package:dio_hub/common/loading_indicator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class APIWrapperController {
  void Function()? refresh;
}

typedef ResponseBuilder<T> = Widget Function(BuildContext context, T data);
typedef ErrorBuilder = Widget Function(BuildContext context, Object? error);

class APIWrapper<T> extends StatefulWidget {
  final Future<T>? getCall;
  final Future<T>? postCall;
  final ResponseBuilder<T>? responseBuilder;
  final WidgetBuilder? loadingBuilder;
  final ErrorBuilder? errorBuilder;
  final T? initialData;
  final APIWrapperController? apiWrapperController;
  final bool fadeIntoView;
  const APIWrapper({
    Key? key,
    this.getCall,
    this.postCall,
    this.fadeIntoView = true,
    this.apiWrapperController,
    this.initialData,
    this.responseBuilder,
    this.errorBuilder,
    this.loadingBuilder,
  }) : super(key: key);

  @override
  _APIWrapperState<T> createState() => _APIWrapperState();
}

class _APIWrapperState<T> extends State<APIWrapper<T?>> {
  T? data;
  bool loading = true;
  Object? error;

  // Doing it this way instead of a future builder for better error handling.
  // And to add a refresh controller in the future.
  void setupWidget() async {
    if (widget.initialData == null) {
      await fetchData();
    } else {
      data = widget.initialData;
      if (mounted) {
        setState(() {
          loading = false;
        });
      }
    }
  }

  Future fetchData() async {
    if (mounted) {
      setState(() {
        loading = true;
      });
    }
    try {
      error = null;
      data = await widget.getCall;
    } catch (e) {
      error = e;
    }
    if (mounted) {
      setState(() {
        loading = false;
      });
    }
  }

  @override
  void initState() {
    setupController();
    setupWidget();
    super.initState();
  }

  void setupController() {
    widget.apiWrapperController?.refresh = fetchData;
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return widget.loadingBuilder != null
          ? widget.loadingBuilder!(context)
          : const LoadingIndicator();
    } else if (error != null) {
      return widget.errorBuilder != null
          ? widget.errorBuilder!(context, error)
          // : Text(error!);
          : Builder(builder: (context) {
              if (error is DioError) {
                DioError err = error as DioError;

                return Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Text(
                    '${err.response!.statusCode}. ${err.response!.statusMessage}.',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                );
              }
              return Padding(
                padding: const EdgeInsets.all(24.0),
                child: Text(
                    kReleaseMode ? 'Something went wrong.' : error.toString()),
              );
            });
    }

    if (widget.fadeIntoView) {
      return FadeAnimationSection(
        child: widget.responseBuilder!(context, data),
      );
    }
    return widget.responseBuilder!(context, data);
  }
}
