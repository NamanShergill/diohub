import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Text richText(List<TextSpan> text,
        {TextStyle? defaultStyle, TextAlign? textAlign}) =>
    Text.rich(
      TextSpan(children: text),
      style: defaultStyle,
      textAlign: textAlign,
    );
