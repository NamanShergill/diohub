import 'package:flutter/material.dart';

class AppDialog extends StatelessWidget {
  final String? title;
  final Widget? content;
  final List<Widget>? actions;
  const AppDialog({this.title, this.content, this.actions, Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: title != null
          ? Text(
              title!,
              style: Theme.of(context).textTheme.headline6,
            )
          : null,
      content: content,
      actions: actions,
    );
  }
}
