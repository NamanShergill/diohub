import 'package:dio_hub/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/atom-one-light.dart';
import 'package:flutter_highlight/themes/monokai-sublime.dart';

class CodeBlockView extends StatelessWidget {
  const CodeBlockView(this.data, {this.language, super.key});
  final String data;
  final String? language;
  @override
  Widget build(final BuildContext context) => HighlightView(
        data,
        backgroundColor: Colors.transparent,
        theme: _getTheme(context),
        language: language ?? 'txt',
      );

  Map<String, TextStyle> _getTheme(final BuildContext context) =>
      switch (context.colorScheme.brightness) {
        Brightness.dark => monokaiSublimeTheme,
        Brightness.light => atomOneLightTheme,
      };
}
