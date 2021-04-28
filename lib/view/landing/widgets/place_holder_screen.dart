import 'package:dio_hub/common/loading_indicator.dart';
import 'package:flutter/material.dart';

class PlaceHolderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoadingIndicator(),
    );
  }
}
