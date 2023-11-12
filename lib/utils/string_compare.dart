class StringFunctions {
  StringFunctions(this.string);
  final String string;

  @override
  String toString() => string;

  bool isStringEqual(final String? string2) =>
      string.toLowerCase() == string2?.toLowerCase();

  bool regexCompleteMatch(final RegExp pattern) {
    final String? match = pattern.firstMatch(string)?.group(0);
    return match != null && match == string;
  }

  bool isStringStartingWith(final String string2) =>
      string.toLowerCase().startsWith(string2.toLowerCase());

  String replaceAllinString(final String string2,
          [final String replaceWith = '',]) =>
      string.toLowerCase().replaceAll(string2.toLowerCase(), replaceWith);

  String replaceFirstInString(final String string2,
          [final String replaceWith = '',]) =>
      string.toLowerCase().replaceFirst(string2.toLowerCase(), replaceWith);
}
