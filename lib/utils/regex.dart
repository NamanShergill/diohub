String regexORCases(final List<String> cases) =>
    '(${cases.map((final String e) => '($e)').toList().join('|')})';

String regexPattern(final List<String> cases, [final String joinWith = '']) =>
    '(${cases.join(joinWith)})';

String optionalRegex(final String pattern) => '($pattern)?';

String negativeLookAhead(final String pattern) => '(?!$pattern)';
String lookAhead(final String pattern) => '(?=$pattern)';
String nonCapturingGroup(final String pattern) => '(?:$pattern)';

extension RegExpExtension on RegExp {
  List<String?> allMatchesWithSep(final String input, [final int start = 0]) {
    int startVal = start;
    final List<String?> result = <String?>[];

    for (final RegExpMatch match in allMatches(input, startVal)) {
      result
        ..add(input.substring(startVal, match.start))
        ..add(match[0]);
      startVal = match.end;
    }
    result.add(input.substring(startVal));
    return result;
  }
}

extension StringExtension on String {
  List<String?> splitWithDelimiter(final RegExp pattern) =>
      pattern.allMatchesWithSep(this);
}
