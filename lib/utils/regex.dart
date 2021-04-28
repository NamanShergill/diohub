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
    var result = <String?>[];
    allMatches(input).forEach((element) {
      // print(input);
      // print(element[0]);
    });
    for (var match in allMatches(input, start)) {
      result.add(input.substring(start, match.start));
      result.add(match[0]);
      start = match.end;
    }
    result.add(input.substring(start));
    return result;
  }
}

extension StringExtension on String {
  List<String?> splitWithDelimiter(RegExp pattern) =>
      pattern.allMatchesWithSep(this);
}
