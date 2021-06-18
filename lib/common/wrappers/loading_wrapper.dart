import 'package:dio_hub/common/misc/loading_indicator.dart';
import 'package:flutter/material.dart';

enum PageStatus { loading, loaded, error }

class LoadingWrapper extends StatelessWidget {
  const LoadingWrapper({
    Key? key,
    required this.builder,
    this.loadingBuilder,
    this.errorBuilder,
    required this.status,
  }) : super(key: key);
  final WidgetBuilder builder;
  final WidgetBuilder? loadingBuilder;
  final WidgetBuilder? errorBuilder;
  final PageStatus status;

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case PageStatus.loaded:
        return builder(context);
      case PageStatus.loading:
        return loadingBuilder != null
            ? loadingBuilder!(context)
            : const LoadingIndicator();
      case PageStatus.error:
        return errorBuilder != null
            ? errorBuilder!(context)
            : const Text('Something went wrong.');
    }
  }
}
