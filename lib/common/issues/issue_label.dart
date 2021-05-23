import 'package:dio_hub/models/issues/issue_model.dart';
import 'package:dio_hub/style/border_radiuses.dart';
import 'package:flutter/material.dart';

class IssueLabel extends StatelessWidget {
  final Label? label;
  const IssueLabel(this.label, {Key? key}) : super(key: key);
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
