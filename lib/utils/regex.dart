String regexORCases(List<String> cases) =>
    '(${cases.map((e) => '($e)').toList().join('|')})';

String regexPattern(List<String> cases, [String joinWith = '']) =>
    '(${cases.join(joinWith)})';

String optionalRegex(String pattern) => '($pattern)?';

String negativeLookAhead(String pattern) => '(?!$pattern)';
String lookAhead(String pattern) => '(?=$pattern)';
String nonCapturingGroup(String pattern) => '(?:$pattern)';

extension RegExpExtension on RegExp {
  List<String?> allMatchesWithSep(String input, [int start = 0]) {
    var startVal = start;
    final result = <String?>[];

    for (final match in allMatches(input, startVal)) {
      result.add(input.substring(startVal, match.start));
      result.add(match[0]);
      startVal = match.end;
    }
    result.add(input.substring(startVal));
    return result;
  }
}

extension StringExtension on String {
  List<String?> splitWithDelimiter(RegExp pattern) =>
      pattern.allMatchesWithSep(this);
}
