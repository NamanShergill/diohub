import 'package:dio/dio.dart';
import 'package:dio_hub/common/misc/api_error.dart';
import 'package:dio_hub/common/misc/loading_indicator.dart';
import 'package:dio_hub/providers/base_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

typedef ErrorBuilder = Widget Function(BuildContext context, Object error);
typedef ChildBuilder<T> = Widget Function(BuildContext context, T value);

class ProviderLoadingProgressWrapper<T extends BaseProvider>
    extends StatefulWidget {
  const ProviderLoadingProgressWrapper({
    required this.childBuilder,
    this.errorBuilder,
    this.loadingBuilder,
    super.key,
    this.listener,
  });
  final ChildBuilder<T> childBuilder;
  final ValueChanged<Status>? listener;
  final WidgetBuilder? loadingBuilder;
  final ErrorBuilder? errorBuilder;

  @override
  ProviderLoadingProgressWrapperState<T> createState() =>
      ProviderLoadingProgressWrapperState<T>();
}

class ProviderLoadingProgressWrapperState<T extends BaseProvider>
    extends State<ProviderLoadingProgressWrapper<T>> {
  @override
  void initState() {
    if (widget.listener != null) {
      context.read<T>().statusStream.listen((final event) {
        widget.listener?.call(event);
      });
    }
    super.initState();
  }

  @override
  Widget build(final BuildContext context) {
    final BaseProvider value = Provider.of<T>(context);
    return StreamBuilder(
      stream: value.statusStream,
      initialData: value.status,
      builder: (final context, final snapshot) {
        if (snapshot.data == Status.loaded) {
          return widget.childBuilder(context, value as T);
        }
        if (snapshot.data == Status.loading) {
          return widget.loadingBuilder != null
              ? widget.loadingBuilder!(context)
              : const LoadingIndicator();
        }
        if (snapshot.data == Status.error) {
          return widget.errorBuilder != null
              ? widget.errorBuilder!(
                  context,
                  value.errorInfo ?? 'Something went wrong.',
                )
              : Builder(
                  builder: (final context) {
                    if (value.errorInfo is DioException) {
                      final err = value.errorInfo! as DioException;
                      if (err.response != null) {
                        return Center(
                          child: APIError(
                            err.response!.statusCode!,
                            err.response!.statusMessage!,
                          ),
                        );
                      }
                    }
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(value.errorInfo.toString()),
                      ),
                    );
                  },
                );
        }
        return widget.loadingBuilder != null
            ? widget.loadingBuilder!(context)
            : const LoadingIndicator();
      },
    );
  }
}
