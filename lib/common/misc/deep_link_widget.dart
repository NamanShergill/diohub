import 'package:dio_hub/controller/deep_linking_handler.dart';
import 'package:flutter/material.dart';

abstract class DeepLinkWidget extends StatefulWidget {
  const DeepLinkWidget({Key? key, this.pathData}) : super(key: key);
  final PathData? pathData;
}

abstract class DeepLinkWidgetState<T extends DeepLinkWidget> extends State<T> {
  void handleDeepLink(PathData deepLinkData);

  @override
  void initState() {
    if (widget.pathData != null) {
      handleDeepLink(widget.pathData!);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
