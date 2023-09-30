import 'package:dio_hub/graphql/graphql.dart';
import 'package:dio_hub/models/issues/issue_model.dart';
import 'package:dio_hub/style/border_radiuses.dart';
import 'package:flutter/material.dart';

class IssueLabel extends StatelessWidget {
  IssueLabel(final Label label, {super.key})
      : name = label.name!,
        color = label.color!;

  IssueLabel.gql(final LabelMixin label, {super.key})
      : name = label.name,
        color = label.color;
  final String name;
  final String color;

  @override
  Widget build(final BuildContext context) => Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: smallBorderRadius,
              border: Border.all(
                color: Color(int.tryParse('0xFF$color') ?? 0xFFFFFFFF),
              ),
              color: Color(int.tryParse('0x60$color') ?? 0xFFFFFFFF),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Center(
                child: Text(
                  name,
                  style: TextStyle(color: Colors.grey.shade300, fontSize: 11),
                ),
              ),
            ),
          ),
        ],
      );
}
