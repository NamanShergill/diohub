import 'package:dio_hub/common/animations/size_expanded_widget.dart';
import 'package:flutter/material.dart';

class CustomExpandTile extends StatelessWidget {
  const CustomExpandTile({
    required this.child,
    required this.onTap,
    required this.title,
    this.expanded = false,
    super.key,
  });
  final Widget title;
  final bool expanded;
  final Widget child;
  final Function() onTap;
  @override
  Widget build(final BuildContext context) => Column(
        children: <Widget>[
          ListTile(
            title: title,
            onTap: onTap,
            trailing: Icon(
              expanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
              // color: expanded
              //     ? Provider.of<PaletteSettings>(context)
              //         .currentSetting
              //         .baseElements
              //     : Provider.of<PaletteSettings>(context).currentSetting.faded3,
            ),
          ),
          SizeExpandedSection(
            expand: expanded,
            child: child,
          ),
        ],
      );
}
