import 'package:flutter/material.dart';
import 'package:onehub/common/animations/fade_animation_widget.dart';
import 'package:onehub/common/loading_indicator.dart';

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
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: widget.apiCall,
        builder: (context, AsyncSnapshot<T> snapshot) {
          if (snapshot.hasError)
            return widget.errorBuilder != null
                ? widget.errorBuilder(context, snapshot.error)
                : Text(snapshot.error);
          else if (snapshot.hasData)
            return FadeAnimationSection(
              child: widget.responseBuilder(context, snapshot.data),
            );
          return widget.loadingBuilder != null
              ? widget.loadingBuilder(context)
              : LoadingIndicator();
        });
  }
}
