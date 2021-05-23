import 'package:flutter/material.dart';

class CustomExpansionTile extends StatelessWidget {
  final bool? expanded;
  final List<Widget>? children;
  final Widget? title;
  const CustomExpansionTile(
      {this.expanded, this.title, this.children, Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        children: children!,
        title: title!,
        initiallyExpanded: expanded!,
      ),
    );
  }
}
