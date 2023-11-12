import 'package:diohub/graphql/queries/issues_pulls/__generated__/timeline.query.data.gql.dart';
import 'package:diohub/models/issues/issue_model.dart';
import 'package:diohub/style/border_radiuses.dart';
import 'package:diohub/utils/utils.dart';
import 'package:flutter/material.dart';

class IssueLabel extends StatelessWidget {
  IssueLabel(final Label label, {super.key})
      : name = label.name!,
        color = label.color!;

  IssueLabel.gql(final Glabel label, {super.key})
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
              color: Color(int.tryParse('0x70$color') ?? 0xFFFFFFFF),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Center(
                child: Text(
                  name,
                  style: TextStyle(
                    color: context.colorScheme.onSurface,
                  ).merge(context.textTheme.bodySmall),
                ),
              ),
            ),
          ),
        ],
      );
}
