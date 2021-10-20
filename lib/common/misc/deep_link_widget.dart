import 'package:dio_hub/controller/deep_linking_handler.dart';
import 'package:flutter/material.dart';

abstract class DeepLinkWidget extends StatefulWidget {
  const DeepLinkWidget({Key? key, this.deepLinkData}) : super(key: key);
  final DeepLinkData? deepLinkData;
}

abstract class DeepLinkWidgetState<T extends DeepLinkWidget> extends State<T> {
  void handleDeepLink(DeepLinkData deepLinkData);

  @override
  void initState() {
    if (widget.deepLinkData != null) {
      handleDeepLink(widget.deepLinkData!);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
