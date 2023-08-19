import 'package:flutter/material.dart';

class AppDialog extends StatelessWidget {
  const AppDialog({this.title, this.content, this.actions, Key? key})
      : super(key: key);
  final String? title;
  final Widget? content;
  final List<Widget>? actions;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: title != null
          ? Text(
              title!,
              style: Theme.of(context).textTheme.titleLarge,
            )
          : null,
      content: content,
      actions: actions,
    );
  }
}
