import 'package:flutter/material.dart';
import 'package:onehub/common/loading_indicator.dart';

import 'animations/fade_animation_widget.dart';

typedef ResponseBuilder<T>(BuildContext context, T data);
typedef ErrorBuilder(BuildContext context, String error);

class APIWrapper<T> extends StatefulWidget {
  final Future<T> apiCall;
  final ResponseBuilder<T> responseBuilder;
  final WidgetBuilder loadingBuilder;
  final ErrorBuilder errorBuilder;
  APIWrapper({
    Key key,
    this.apiCall,
    this.responseBuilder,
    this.errorBuilder,
    this.loadingBuilder,
  }) : super(key: key);

  @override
  _APIWrapperState<T> createState() => _APIWrapperState();
}

class _APIWrapperState<T> extends State<APIWrapper<T>> {
  T data;
  bool loading = true;
  String error;

  // Doing it this way instead of a future builder for better error handling.
  // And to add a refresh controller in the future.
  Future fetchData() async {
    setState(() {
      loading = true;
    });
    if (data == null)
      try {
        error = null;
        data = await widget.apiCall;
      } catch (e) {
        error = e.toString() ?? 'Some error occurred.';
      }
    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (loading)
      return widget.loadingBuilder != null
          ? widget.loadingBuilder(context)
          : LoadingIndicator();
    else if (error != null)
      return widget.errorBuilder != null
          ? widget.errorBuilder(context, error)
          : Text(error);
    return FadeAnimationSection(
      child: widget.responseBuilder(context, data),
    );
  }
}
