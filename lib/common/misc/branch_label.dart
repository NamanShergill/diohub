import 'package:diohub/style/border_radiuses.dart';
import 'package:diohub/utils/utils.dart';
import 'package:flutter/material.dart';

class BranchLabel extends StatelessWidget {
  const BranchLabel(this.name, {super.key});

  final String name;

  @override
  Widget build(final BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: context.colorScheme.primaryContainer,
            borderRadius: context.themeData.borderRadiusTheme?.medBorderRadius,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            child: Text(
              name,
              style: TextStyle(color: context.colorScheme.onPrimaryContainer)
                  .merge(context.textTheme.labelMedium),
            ),
          ),
        ),
      );
}
