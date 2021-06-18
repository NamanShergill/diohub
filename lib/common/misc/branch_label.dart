import 'package:dio_hub/app/settings/palette.dart';
import 'package:dio_hub/style/border_radiuses.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BranchLabel extends StatelessWidget {
  const BranchLabel(this.name, {this.size = 16, Key? key}) : super(key: key);
  final String name;
  final double size;
  @override
  Widget build(BuildContext context) {
    final color = Provider.of<PaletteSettings>(context).currentSetting;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size / 2),
      child: Container(
        decoration: BoxDecoration(
            color: Provider.of<PaletteSettings>(context).currentSetting.accent,
            borderRadius: smallBorderRadius),
        child: Padding(
          padding:
              EdgeInsets.symmetric(vertical: size / 3, horizontal: size / 2),
          child: Text(
            name,
            style: TextStyle(fontSize: size, color: color.elementsOnColors),
          ),
        ),
      ),
    );
  }
}
