import 'package:dio_hub/style/border_radiuses.dart';
import 'package:dio_hub/utils/utils.dart';
import 'package:flutter/material.dart';

class BranchLabel extends StatelessWidget {
  const BranchLabel(this.name, {this.size = 16, super.key});
  final String name;
  final double size;
  @override
  Widget build(final BuildContext context) {
    // final DioHubPalette color =
    //     Provider.of<PaletteSettings>(context).currentSetting;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size / 2),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: context.colorScheme.primary,
          borderRadius: smallBorderRadius,
        ),
        child: Padding(
          padding:
              EdgeInsets.symmetric(vertical: size / 3, horizontal: size / 2),
          child: Text(
            name,
            style:
                TextStyle(fontSize: size, color: context.colorScheme.onPrimary),
          ),
        ),
      ),
    );
  }
}
