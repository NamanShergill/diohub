// Credits: https://github.com/micazi/rich_text_controller

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RichTextController extends TextEditingController {
  final Map<RegExp, TextStyle> patternMap;
  final Map<RegExp, TextStyle> blacklistPatternMap;
  final ValueChanged<List<String?>>? wlMatches;
  final ValueChanged<List<String?>>? blMatches;
  final Function(List<String> match)? onMatch;
  RichTextController(
      {String? text,
      required this.patternMap,
      this.onMatch,
      this.wlMatches,
      this.blMatches,
      required this.blacklistPatternMap})
      : super(text: text);

  RichTextController.fromValue(TextEditingValue value,
      {required this.patternMap,
      this.onMatch,
      this.wlMatches,
      this.blMatches,
      required this.blacklistPatternMap})
      : assert(
          !value.composing.isValid || value.isComposingRangeValid,
          'New TextEditingValue $value has an invalid non-empty composing range '
          '${value.composing}. It is recommended to use a valid composing range, '
          'even for readonly text fields',
        ),
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
    String wlRegex = patternMap.keys.map((e) => e.pattern).join('|');
    String blRegex = blacklistPatternMap.keys.map((e) => e.pattern).join('|');
    Map<RegExp, TextStyle> combinedMap = {};
    combinedMap.addAll(patternMap);
    combinedMap.addAll(blacklistPatternMap);

    allRegex = RegExp('$wlRegex|$blRegex');
    if (wlMatches != null)
      wlMatches!(
          RegExp(wlRegex).allMatches(text).map((e) => (e.group(0)!)).toList());
    if (blMatches != null)
      blMatches!(
          RegExp(blRegex).allMatches(text).map((e) => (e.group(0)!)).toList());
    text.splitMapJoin(
      allRegex,
      onMatch: (Match m) {
        if (!matches.contains(m[0])) matches.add(m[0]!);
        RegExp? k = combinedMap.entries.firstWhere((element) {
          return element.key.allMatches(m[0]!).isNotEmpty;
        }).key;
        children.add(
          TextSpan(
            text: m[0],
            style: combinedMap[k],
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
