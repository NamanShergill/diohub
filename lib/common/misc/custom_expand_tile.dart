import 'package:dio_hub/app/settings/palette.dart';
import 'package:dio_hub/common/animations/size_expanded_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomExpandTile extends StatelessWidget {
  final Widget title;
  final bool expanded;
  final Widget child;
  final Function() onTap;
  const CustomExpandTile(
      {this.expanded = false,
      required this.child,
      required this.onTap,
      required this.title,
      Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: title,
          onTap: onTap,
          trailing: Icon(
            expanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
            color: expanded
                ? Provider.of<PaletteSettings>(context)
                    .currentSetting
                    .baseElements
                : Provider.of<PaletteSettings>(context).currentSetting.faded3,
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
