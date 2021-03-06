import 'package:flutter/material.dart';
import 'package:onehub/common/loading_indicator.dart';
import 'package:onehub/providers/base_provider.dart';
import 'package:provider/provider.dart';

typedef ErrorBuilder = Widget Function(BuildContext context, String error);

class ProviderLoadingProgressWrapper<T extends BaseProvider>
    extends StatelessWidget {
  final builder;
  final loadingBuilder;
  final ErrorBuilder errorBuilder;
  ProviderLoadingProgressWrapper(
      {this.builder, this.errorBuilder, this.loadingBuilder});
  @override
  Widget build(BuildContext context) {
    final BaseProvider value = Provider.of<T>(context);
    return StreamBuilder(
        stream: value.statusStream,
        initialData: value.status,
        builder: (context, AsyncSnapshot<Status> snapshot) {
          if (snapshot.data == Status.loaded) return builder(context, value);
          if (snapshot.data == Status.loading)
            return loadingBuilder != null
                ? loadingBuilder(context)
                : LoadingIndicator();
          if (snapshot.data == Status.error)
            return errorBuilder != null
                ? errorBuilder(context, value.error)
                : Center(
                    child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(value.error),
                  ));
          return loadingBuilder != null
              ? loadingBuilder(context)
              : LoadingIndicator();
        });
  }
}
