import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Text richText(
  final List<TextSpan> text, {
  final TextStyle? defaultStyle,
  final TextAlign? textAlign,
}) =>
    Text.rich(
      TextSpan(children: text),
      style: defaultStyle,
      textAlign: textAlign,
    );
