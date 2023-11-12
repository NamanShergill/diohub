import 'dart:collection';
import 'dart:convert';

import 'package:diohub/utils/lang_colors/colors_data.dart';

int getLangColor(final String? language) {
  final LinkedHashMap<String, dynamic> langData =
      LinkedHashMap<String, dynamic>(
    equals: (final String a, final String b) =>
        a.toLowerCase() == b.toLowerCase(),
    hashCode: (final String p0) => p0.toLowerCase().hashCode,
    //  (key) => key.toLowerCase().hashCode
  );
  final Map<String, dynamic> map = jsonDecode(colorsData);
  langData.addAll(map);
  if (langData.containsKey(language)) {
    if (langData[language]['color'] != null) {
      final String color = langData[language]['color'];
      return int.parse(color.replaceFirst('#', '0xFF'));
    }
  }
  return 0xFF878787;
}
