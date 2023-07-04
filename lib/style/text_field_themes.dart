import 'package:dio_hub/app/settings/palette.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

InputDecoration inputDecoration({
  String? labelText,
  String? hintText,
  FocusNode? focusNode,
  IconData? icon,
  EdgeInsetsGeometry? contentPadding,
  Color? enabledBorderColor,
  Widget? suffixIcon,
  required BuildContext context,
}) =>
    InputDecoration(
      labelText: labelText,
      hintText: hintText?.replaceRange(0, 0, ' '),
      contentPadding: contentPadding,
      suffixIcon: Padding(
        padding: const EdgeInsets.all(16.0),
        child: suffixIcon ??
            Icon(
              icon,
              color: focusNode?.hasFocus ?? false
                  ? Provider.of<PaletteSettings>(context).currentSetting.faded3
                  : Provider.of<PaletteSettings>(context)
                      .currentSetting
                      .faded3
                      .withOpacity(0.7),
            ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: enabledBorderColor ?? Colors.transparent),
      ),
    );
