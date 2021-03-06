import 'package:flutter/material.dart';

class CustomExpansionTile extends StatelessWidget {
  final bool expanded;
  final List<Widget> children;
  final Widget title;
  CustomExpansionTile({this.expanded, this.title, this.children});
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        children: children,
        title: title,
        initiallyExpanded: expanded,
      ),
    );
  }
}
