class StringFunctions {
  final String string;
  StringFunctions(this.string);

  toString() => string;

  bool isStringEqual(String? string2) {
    return string.toLowerCase() == string2?.toLowerCase();
  }

  bool regexCompleteMatch(String pattern) {
    RegExp regexp = RegExp(pattern);
    String? match = regexp.firstMatch(string)?.group(0);
    return match != null && match == string;
  }

  bool isStringStartingWith(String string2) {
    return string.toLowerCase().startsWith(string2.toLowerCase());
  }

  String replaceAllinString(String string2, [String replaceWith = '']) {
    return string.toLowerCase().replaceAll(string2.toLowerCase(), replaceWith);
  }

  String replaceFirstInString(String string2, [String replaceWith = '']) {
    return string
        .toLowerCase()
        .replaceFirst(string2.toLowerCase(), replaceWith);
  }
}
