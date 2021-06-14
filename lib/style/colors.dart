import 'package:dio_hub/app/global.dart';
import 'package:dio_hub/app/settings/palette.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppColor {
  // Provider.of<PaletteSettings>(context).currentSetting._();
  static Color accent =
      Provider.of<PaletteSettings>(Global.currentContext).currentSetting.accent;
  static Color background = Provider.of<PaletteSettings>(Global.currentContext)
      .currentSetting
      .background;
  // static Color background = Color(0xff151618);
  static Color onBackground =
      Provider.of<PaletteSettings>(Global.currentContext)
          .currentSetting
          .onBackground;
  static Color baseElements =
      Provider.of<PaletteSettings>(Global.currentContext)
          .currentSetting
          .baseElements;
  static Color elementsOnColors =
      Provider.of<PaletteSettings>(Global.currentContext)
          .currentSetting
          .elementsOnColors;
  static Color green =
      Provider.of<PaletteSettings>(Global.currentContext).currentSetting.green;
  static Color red =
      Provider.of<PaletteSettings>(Global.currentContext).currentSetting.red;
  static Color faded1 =
      Provider.of<PaletteSettings>(Global.currentContext).currentSetting.faded1;
  static Color faded2 =
      Provider.of<PaletteSettings>(Global.currentContext).currentSetting.faded2;
  static Color faded3 =
      Provider.of<PaletteSettings>(Global.currentContext).currentSetting.faded3;
}
