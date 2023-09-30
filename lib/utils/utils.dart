import 'dart:convert';

import 'package:flutter/material.dart';

class Utils {
  Utils._();

  static Map<String, dynamic>? parseJwt(final String token) {
    final List<String> parts = token.split('&');
    if (parts.length != 2) {
      return null;
    }

    final String payload = parts[1];
    final String normalized = base64Url.normalize(payload);
    final String resp = utf8.decode(base64Url.decode(normalized));
    final dynamic payloadMap = json.decode(resp);
    if (payloadMap is! Map<String, dynamic>) {
      return null;
    }
    return payloadMap;
  }

  static String hexToInt(final String fullString) {
    final String string = fullString.replaceAll('-', '');
    final StringBuffer buffer = StringBuffer();
    for (int i = 0; i <= string.length - 8; i += 8) {
      final String hex = string.substring(i, i + 8);

      final int number = int.parse(hex, radix: 16);
      buffer.write(number);
    }
    return buffer.toString();
  }
}

extension ThemeExtension on BuildContext {
  ThemeData get themeData => Theme.of(this);

  TextTheme get textTheme => themeData.textTheme;
}
