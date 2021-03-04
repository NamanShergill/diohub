import 'package:flutter/material.dart';
import 'package:onehub/common/loading_indicator.dart';
import 'package:onehub/providers/base_provider.dart';
import 'package:provider/provider.dart';

class ProviderLoadingProgressWrapper<T extends BaseProvider>
    extends StatelessWidget {
  final builder;
  final loadingBuilder;
  final errorBuilder;
  ProviderLoadingProgressWrapper(
      {this.builder, this.errorBuilder, this.loadingBuilder});
  @override
  Widget build(BuildContext context) {
    final BaseProvider value = Provider.of<T>(context);
    if (value.status == Status.loaded) return builder(context, value);
    if (value.status == Status.loading)
      return loadingBuilder(context) ?? LoadingIndicator();
    if (value.status == Status.error)
      return errorBuilder(context, value.error) ?? Text(value.error);
    return Container();
  }
}
