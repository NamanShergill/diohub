import 'package:flutter/material.dart';
import 'package:onehub/common/loading_indicator.dart';

import 'animations/fade_animation_widget.dart';

class APIWrapperController {
  void Function()? refresh;
}

typedef ResponseBuilder<T>(BuildContext context, T data);
typedef ErrorBuilder(BuildContext context, String? error);

class APIWrapper<T> extends StatefulWidget {
  final Future<T>? getCall;
  final Future<T>? postCall;
  final ResponseBuilder<T>? responseBuilder;
  final WidgetBuilder? loadingBuilder;
  final ErrorBuilder? errorBuilder;
  final T? initialData;
  final APIWrapperController? apiWrapperController;
  APIWrapper({
    Key? key,
    this.getCall,
    this.postCall,
    this.apiWrapperController,
    this.initialData,
    this.responseBuilder,
    this.errorBuilder,
    this.loadingBuilder,
  }) : super(key: key);

  @override
  _APIWrapperState<T> createState() => _APIWrapperState(apiWrapperController);
}

class _APIWrapperState<T> extends State<APIWrapper<T?>> {
  _APIWrapperState(APIWrapperController? controller) {
    if (controller != null) controller.refresh = fetchData;
  }
  T? data;
  bool loading = true;
  String? error;

  // Doing it this way instead of a future builder for better error handling.
  // And to add a refresh controller in the future.
  void setupWidget() async {
    if (widget.initialData == null)
      await fetchData();
    else {
      data = widget.initialData;
      setState(() {
        loading = false;
      });
    }
  }

  Future fetchData() async {
    setState(() {
      loading = true;
    });
    try {
      error = null;
      data = await widget.getCall;
    } catch (e) {
      error = e.toString();
    }
    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    setupWidget();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (loading)
      return widget.loadingBuilder != null
          ? widget.loadingBuilder!(context)
          : LoadingIndicator();
    else if (error != null)
      return widget.errorBuilder != null
          ? widget.errorBuilder!(context, error)
          : Text(error!);
    return FadeAnimationSection(
      child: widget.responseBuilder!(context, data),
    );
  }
}
