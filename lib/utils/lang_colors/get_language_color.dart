import 'dart:convert';

import 'package:onehub/utils/lang_colors/colorsData.dart';

String getLangColor(String? language) {
  Map langData = jsonDecode(colorsData);
  if (langData.containsKey(language)) {
    if (langData[language]['color'] != null) return langData[language]['color'];
  }
  return '#878787';
}
