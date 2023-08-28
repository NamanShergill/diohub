import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/monokai-sublime.dart';

class CodeBlockView extends StatelessWidget {
  const CodeBlockView(this.data, {this.language, super.key});
  final String data;
  final String? language;
  @override
  Widget build(final BuildContext context) => HighlightView(
        data,
        backgroundColor: Colors.transparent,
        theme: monokaiSublimeTheme,
        language: language ?? 'txt',
      );
}
