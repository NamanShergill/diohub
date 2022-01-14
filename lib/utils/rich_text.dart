import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Text richText(List<TextSpan> text, {TextStyle? defaultStyle}) => Text.rich(
      TextSpan(children: text),
      overflow: TextOverflow.fade,
    );
