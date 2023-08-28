import 'package:flutter/material.dart';

List<Widget> wrapPaddingToWidgets(
  final List<Widget> widgets, {
  final EdgeInsets padding = const EdgeInsets.all(8),
}) =>
    widgets
        .map(
          (final e) => Padding(
            padding: padding,
            child: e,
          ),
        )
        .toList();
