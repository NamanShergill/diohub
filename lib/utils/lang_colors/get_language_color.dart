import 'dart:convert';

import 'package:onehub/utils/lang_colors/colorsData.dart';

String getLangColor(String? language) {
  Map langData = jsonDecode(colorsData);
  if (langData.containsKey(language)) return langData[language]['color'];
  return '#FFFFFF';
}
