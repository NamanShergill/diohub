import 'package:flutter/material.dart';
import 'package:onehub/style/borderRadiuses.dart';
import 'package:onehub/style/colors.dart';

class BranchLabel extends StatelessWidget {
  final String name;
  BranchLabel(this.name);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: Container(
        decoration: BoxDecoration(
            color: AppColor.accent,
            borderRadius: AppThemeBorderRadius.smallBorderRadius),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 4),
          child: Text(
            name,
            style: TextStyle(fontSize: 12),
          ),
        ),
      ),
    );
  }
}
