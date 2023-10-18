import 'package:diohub/utils/utils.dart';
import 'package:flutter/material.dart';

class AppDialog extends StatelessWidget {
  const AppDialog({this.title, this.content, this.actions, super.key});
  final String? title;
  final Widget? content;
  final List<Widget>? actions;
  @override
  Widget build(final BuildContext context) => AlertDialog(
        title: title != null
            ? Text(
                title!,
                style: context.textTheme.headlineMedium,
              )
            : null,
        content: content,
        actions: actions,
      );
}
