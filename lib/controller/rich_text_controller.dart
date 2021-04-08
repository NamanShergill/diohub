// Credits: https://github.com/micazi/rich_text_controller

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RichTextController extends TextEditingController {
  final Map<RegExp, TextStyle>? patternMap;
  final Map<String, TextStyle>? stringMap;
  final Function(List<String> match)? onMatch;
  RichTextController(
      {String? text, this.patternMap, this.stringMap, this.onMatch})
      : assert(patternMap == null || stringMap == null),
        super(text: text);

  RichTextController.fromValue(TextEditingValue value,
      {this.patternMap, this.stringMap, this.onMatch})
      : assert(
          value == null ||
              !value.composing.isValid ||
              value.isComposingRangeValid,
          'New TextEditingValue $value has an invalid non-empty composing range '
          '${value.composing}. It is recommended to use a valid composing range, '
          'even for readonly text fields',
        ),
        assert(patternMap == null || stringMap == null),
        super.fromValue(value);
  @override
  TextSpan buildTextSpan(
      {required BuildContext context,
      TextStyle? style,
      required bool withComposing}) {
    List<TextSpan> children = [];
    List<String> matches = [];
    // Validating with REGEX
    RegExp? allRegex;
    allRegex = patternMap != null
        ? RegExp(patternMap!.keys.map((e) => e.pattern).join('|'))
        : null;
    // Validating with Strings
    RegExp? stringRegex;
    stringRegex = stringMap != null
        ? RegExp(r'\b' + stringMap!.keys.join('|').toString() + r'+\b')
        : null;
    ////
    text.splitMapJoin(
      stringMap == null ? allRegex! : stringRegex!,
      onMatch: (Match m) {
        if (!matches.contains(m[0])) matches.add(m[0]!);
        RegExp? k = patternMap?.entries.firstWhere((element) {
          return element.key.allMatches(m[0]!).isNotEmpty;
        }).key;
        String? ks = stringMap?.entries.firstWhere((element) {
          return element.key.allMatches(m[0]!).isNotEmpty;
        }).key;

        children.add(
          TextSpan(
            text: m[0],
            style: stringMap == null ? patternMap![k] : stringMap![ks],
          ),
        );

        return (this.onMatch != null ? this.onMatch!(matches) : null);
      },
      onNonMatch: (String span) {
        children.add(TextSpan(text: span, style: style));
        return span.toString();
      },
    );

    return TextSpan(style: style, children: children);
  }
}
