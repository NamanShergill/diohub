import 'dart:ui';

import 'package:dio_hub/style/colors.dart';
import 'package:flutter/material.dart';

class BaseAuthDialog extends StatelessWidget {
  final Widget? child;
  BaseAuthDialog({this.child});
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        backgroundColor: AppColor.background,
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: child,
          ),
        ),
      ),
    );
  }
}
