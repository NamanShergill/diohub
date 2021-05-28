import 'package:dio/dio.dart';
import 'package:dio_hub/common/api_error.dart';
import 'package:dio_hub/common/loading_indicator.dart';
import 'package:dio_hub/providers/base_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

typedef ErrorBuilder = Widget Function(BuildContext context, Object error);
typedef ChildBuilder<T> = Widget Function(BuildContext context, T value);

class ProviderLoadingProgressWrapper<T extends BaseProvider>
    extends StatelessWidget {
  final ChildBuilder<T>? childBuilder;
  final WidgetBuilder? loadingBuilder;
  final ErrorBuilder? errorBuilder;
  const ProviderLoadingProgressWrapper(
      {this.childBuilder, this.errorBuilder, this.loadingBuilder, Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final BaseProvider value = Provider.of<T>(context);
    return StreamBuilder(
        stream: value.statusStream,
        initialData: value.status,
        builder: (context, AsyncSnapshot<Status> snapshot) {
          if (snapshot.data == Status.loaded) {
            return childBuilder!(context, value as T);
          }
          if (snapshot.data == Status.loading) {
            return loadingBuilder != null
                ? loadingBuilder!(context)
                : const LoadingIndicator();
          }
          if (snapshot.data == Status.error) {
            return errorBuilder != null
                ? errorBuilder!(
                    context, value.errorInfo ?? 'Something went wrong.')
                : Builder(
                    builder: (context) {
                      if (value.errorInfo is DioError) {
                        DioError err = value.errorInfo as DioError;
                        if (err.response != null) {
                          return Center(
                              child: APIError(err.response!.statusCode!,
                                  err.response!.statusMessage!));
                        }
                      }
                      return Center(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(value.errorInfo.toString()),
                      ));
                    },
                  );
          }
          return loadingBuilder != null
              ? loadingBuilder!(context)
              : const LoadingIndicator();
        });
  }
}
