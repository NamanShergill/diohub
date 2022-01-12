import 'package:dio_hub/graphql/graphql.dart';
import 'package:dio_hub/models/issues/issue_model.dart';
import 'package:dio_hub/style/border_radiuses.dart';
import 'package:flutter/material.dart';

class IssueLabel extends StatelessWidget {
  IssueLabel(Label label, {Key? key})
      : name = label.name!,
        color = label.color!,
        super(key: key);

  IssueLabel.gql(LabelMixin label, {Key? key})
      : name = label.name,
        color = label.color,
        super(key: key);
  final String name;
  final String color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
            decoration: BoxDecoration(
              borderRadius: smallBorderRadius,
              border: Border.all(
                  color: Color(int.tryParse('0xFF$color') ?? 0xFFFFFFFF)),
              color: Color(int.tryParse('0x60$color') ?? 0xFFFFFFFF),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
              child: Center(
                child: Text(
                  name,
                  style: TextStyle(color: Colors.grey.shade300, fontSize: 11),
                ),
              ),
            )),
      ],
    );
  }
}
