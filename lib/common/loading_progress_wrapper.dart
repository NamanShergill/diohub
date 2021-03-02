import 'package:flutter/material.dart';
import 'package:onehub/common/loading_indicator.dart';
import 'package:onehub/models/enums/status_enum.dart';
import 'package:onehub/providers/base_provider.dart';
import 'package:provider/provider.dart';

class LoadingProgressWrapper<T extends BaseProvider> extends StatelessWidget {
  final builder;
  LoadingProgressWrapper({this.builder});
  @override
  Widget build(BuildContext context) {
    final BaseProvider value = Provider.of<T>(context);
    if (value.status == Status.Loaded) return builder(context, value);
    if (value.status == Status.Loading) return LoadingIndicator();
    if (value.status == Status.Error) return Text('Error');
    return Container();
  }
}
