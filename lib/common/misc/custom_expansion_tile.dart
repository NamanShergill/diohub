import 'package:flutter/material.dart';

class CustomExpansionTile extends StatelessWidget {
  const CustomExpansionTile(
      {this.expanded, this.title, this.children, Key? key})
      : super(key: key);
  final bool? expanded;
  final List<Widget>? children;
  final Widget? title;
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        title: title!,
        initiallyExpanded: expanded!,
        children: children!,
      ),
    );
  }
}
