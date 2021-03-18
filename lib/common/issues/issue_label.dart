import 'package:flutter/material.dart';
import 'package:onehub/models/issues/issue_model.dart';
import 'package:onehub/style/borderRadiuses.dart';

class IssueLabel extends StatelessWidget {
  final Label? label;
  IssueLabel(this.label);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
            decoration: BoxDecoration(
              borderRadius: AppThemeBorderRadius.smallBorderRadius,
              border: Border.all(
                  color:
                      Color(int.tryParse('0xFF${label!.color}') ?? 0xFFFFFFFF)),
              color: Color(int.tryParse('0x60${label!.color}') ?? 0xFFFFFFFF),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
              child: Center(
                child: Text(
                  label!.name!,
                  style: TextStyle(color: Colors.grey.shade300, fontSize: 11),
                ),
              ),
            )),
      ],
    );
  }
}
