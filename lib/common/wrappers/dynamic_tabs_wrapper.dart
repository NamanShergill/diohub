import 'package:dio_hub/common/wrappers/provider_loading_progress_wrapper.dart';
import 'package:dio_hub/controller/dynamic_tabs.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DynamicTabsWrapper extends StatelessWidget {
  const DynamicTabsWrapper(
      {required this.dynamicTabsController, Key? key, required this.builder})
      : super(key: key);
  final DynamicTabsController dynamicTabsController;
  final ChildBuilder<DynamicTabsController> builder;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => dynamicTabsController,
      builder: (context, _) {
        final controller = Provider.of<DynamicTabsController>(context);
        return builder(context, controller);
      },
    );
  }
}
