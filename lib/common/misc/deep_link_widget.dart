import 'package:diohub/controller/deep_linking_handler.dart';
import 'package:flutter/material.dart';

abstract class DeepLinkWidget extends StatefulWidget {
  const DeepLinkWidget({super.key, this.pathData});
  final PathData? pathData;
}

abstract class DeepLinkWidgetState<T extends DeepLinkWidget> extends State<T> {
  void handleDeepLink(final PathData deepLinkData);

  @override
  void initState() {
    if (widget.pathData != null) {
      handleDeepLink(widget.pathData!);
    }
    super.initState();
  }

  @override
  Widget build(final BuildContext context) => Container();
}
