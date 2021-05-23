import 'dart:convert';

import 'package:dio_hub/utils/lang_colors/colors_data.dart';

String getLangColor(String? language) {
  Map langData = jsonDecode(colorsData);
  if (langData.containsKey(language)) {
    if (langData[language]['color'] != null) return langData[language]['color'];
  }
  return '#878787';
}
