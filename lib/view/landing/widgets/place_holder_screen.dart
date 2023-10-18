import 'package:auto_route/annotations.dart';
import 'package:diohub/common/misc/loading_indicator.dart';
import 'package:flutter/material.dart';

@RoutePage()
class PlaceHolderScreen extends StatelessWidget {
  const PlaceHolderScreen({super.key});
  @override
  Widget build(final BuildContext context) => const Scaffold(
        body: LoadingIndicator(),
      );
}
