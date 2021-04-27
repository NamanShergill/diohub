import 'package:dio_hub/common/animations/size_expanded_widget.dart';
import 'package:dio_hub/style/colors.dart';
import 'package:flutter/material.dart';

class CustomExpandTile extends StatelessWidget {
  final Widget title;
  final bool expanded;
  final Widget child;
  final Function() onTap;
  CustomExpandTile(
      {this.expanded = false,
      required this.child,
      required this.onTap,
      required this.title});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: title,
          onTap: onTap,
          trailing: Icon(
            expanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
            color: expanded ? Colors.white : AppColor.grey3,
          ),
        ),
        SizeExpandedSection(
          expand: expanded,
          child: child,
        ),
      ],
    );
  }
}
