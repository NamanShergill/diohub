import 'package:dio_hub/app/settings/palette.dart';
import 'package:dio_hub/style/border_radiuses.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TextFieldTheme {
  static InputDecoration inputDecoration(
          {String? labelText,
          String? hintText,
          FocusNode? focusNode,
          IconData? icon,
          Color? enabledBorderColor,
          Widget? suffixIcon,
          required BuildContext context}) =>
      InputDecoration(
        contentPadding: const EdgeInsets.all(16),
        labelText: labelText,
        hintText: hintText?.replaceRange(0, 0, ' '),
        fillColor:
            Provider.of<PaletteSettings>(context).currentSetting.secondary,
        suffixIcon: Padding(
          padding: const EdgeInsets.all(16.0),
          child: suffixIcon ??
              Icon(
                icon,
                color: focusNode?.hasFocus ?? false
                    ? Provider.of<PaletteSettings>(context)
                        .currentSetting
                        .faded3
                    : Provider.of<PaletteSettings>(context)
                        .currentSetting
                        .faded3
                        .withOpacity(0.7),
              ),
        ),
        hintStyle: TextStyle(
            color: Provider.of<PaletteSettings>(context)
                .currentSetting
                .faded3
                .withOpacity(0.7),
            fontSize: 12),
        filled: true,
        enabledBorder: _enabledBorder(enabledBorderColor ?? Colors.transparent),
        focusedBorder: _focusedBorder(context),
        labelStyle: TextStyle(
            color: Provider.of<PaletteSettings>(context).currentSetting.faded3),
        border: _border,
      );

  static final OutlineInputBorder _border = OutlineInputBorder(
    borderRadius: AppThemeBorderRadius.medBorderRadius,
  );

  static OutlineInputBorder _enabledBorder(Color borderColor) =>
      OutlineInputBorder(
          borderSide: BorderSide(color: borderColor),
          borderRadius: AppThemeBorderRadius.medBorderRadius);

  static OutlineInputBorder _focusedBorder(BuildContext context) =>
      OutlineInputBorder(
          borderSide: BorderSide(
              color:
                  Provider.of<PaletteSettings>(context).currentSetting.faded3),
          borderRadius: AppThemeBorderRadius.medBorderRadius);
}
