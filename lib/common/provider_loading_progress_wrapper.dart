import 'package:flutter/material.dart';
import 'package:onehub/common/loading_indicator.dart';
import 'package:onehub/providers/base_provider.dart';
import 'package:provider/provider.dart';

typedef ErrorBuilder(BuildContext context, String error);
typedef ChildBuilder<T>(BuildContext context, T value);

class ProviderLoadingProgressWrapper<T extends BaseProvider>
    extends StatelessWidget {
  final ChildBuilder<T>? childBuilder;
  final WidgetBuilder? loadingBuilder;
  final ErrorBuilder? errorBuilder;
  ProviderLoadingProgressWrapper(
      {this.childBuilder, this.errorBuilder, this.loadingBuilder});
  @override
  Widget build(BuildContext context) {
    final BaseProvider value = Provider.of<T>(context);
    return StreamBuilder(
        stream: value.statusStream,
        initialData: value.status,
        builder: (context, AsyncSnapshot<Status> snapshot) {
          if (snapshot.data == Status.loaded)
            return childBuilder!(context, value as T);
          if (snapshot.data == Status.loading)
            return loadingBuilder != null
                ? loadingBuilder!(context)
                : LoadingIndicator();
          if (snapshot.data == Status.error)
            return errorBuilder != null
                ? errorBuilder!(context, value.error ?? 'Something went wrong.')
                : Center(
                    child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(value.error ?? 'Something went wrong.'),
                  ));
          return loadingBuilder != null
              ? loadingBuilder!(context)
              : LoadingIndicator();
        });
  }
}
