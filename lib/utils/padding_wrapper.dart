import 'package:flutter/material.dart';

List<Widget> wrapPaddingToWidgets(
  List<Widget> widgets, {
  EdgeInsets padding = const EdgeInsets.all(8),
}) =>
    widgets
        .map(
          (e) => Padding(
            padding: padding,
            child: e,
          ),
        )
        .toList();
