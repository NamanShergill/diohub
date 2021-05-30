import 'package:dio_hub/style/border_radiuses.dart';
import 'package:dio_hub/style/colors.dart';
import 'package:flutter/material.dart';

class BaseAuthDialog extends StatelessWidget {
  final Widget child;
  const BaseAuthDialog({required this.child, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: AppThemeBorderRadius.bigBorderRadius,
      color: AppColor.background,
      // elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: child,
      ),
    );
  }
}
