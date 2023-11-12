import 'package:flutter/material.dart';

InputDecoration inputDecoration({
  required final BuildContext context,
  final String? labelText,
  final String? hintText,
  final FocusNode? focusNode,
  final IconData? icon,
  final EdgeInsetsGeometry? contentPadding,
  final Color? enabledBorderColor,
  final Widget? suffixIcon,
}) =>
    InputDecoration(
      labelText: labelText,
      hintText: hintText?.replaceRange(0, 0, ' '),
      contentPadding: contentPadding,
      suffixIcon: Padding(
        padding: const EdgeInsets.all(16),
        child: suffixIcon ??
            Icon(
              icon,
            ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: enabledBorderColor ?? Colors.transparent),
      ),
    );
