// Credits: https://github.com/micazi/rich_text_controller/blob/7f0e94fd98eb0d5ea7836f2c338426218badef60/lib/rich_text_controller.dart

/*
MIT License

Copyright (c) 2020 Micazi

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/

//-----------------------------------------------------------------------------

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
