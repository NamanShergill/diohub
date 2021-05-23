import 'package:dio_hub/style/border_radiuses.dart';
import 'package:dio_hub/style/colors.dart';
import 'package:flutter/material.dart';

class TextFieldTheme {
  static InputDecoration inputDecoration(
          {String? labelText,
          String? hintText,
          FocusNode? focusNode,
          IconData? icon,
          Color? enabledBorderColor,
          Widget? suffixIcon}) =>
      InputDecoration(
        contentPadding: const EdgeInsets.all(16),
        labelText: labelText,
        hintText: hintText?.replaceRange(0, 0, ' '),
        fillColor: AppColor.onBackground,
        suffixIcon: Padding(
          padding: const EdgeInsets.all(16.0),
          child: suffixIcon ??
              Icon(
                icon,
                color: focusNode?.hasFocus ?? false
                    ? AppColor.grey3
                    : AppColor.grey3.withOpacity(0.7),
              ),
        ),
        hintStyle:
            TextStyle(color: AppColor.grey3.withOpacity(0.7), fontSize: 12),
        filled: true,
        enabledBorder: _enabledBorder(enabledBorderColor ?? Colors.transparent),
        focusedBorder: _focusedBorder,
        labelStyle: const TextStyle(color: AppColor.grey3),
        border: _border,
      );

  static final OutlineInputBorder _border = OutlineInputBorder(
    borderRadius: AppThemeBorderRadius.medBorderRadius,
  );

  static OutlineInputBorder _enabledBorder(Color borderColor) =>
      OutlineInputBorder(
          borderSide: BorderSide(color: borderColor),
          borderRadius: AppThemeBorderRadius.medBorderRadius);

  static final OutlineInputBorder _focusedBorder = OutlineInputBorder(
      borderSide: const BorderSide(color: AppColor.grey3),
      borderRadius: AppThemeBorderRadius.medBorderRadius);
}
