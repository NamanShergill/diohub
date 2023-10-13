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
  ColorScheme get colorScheme => themeData.colorScheme;

  TextTheme get textTheme => themeData.textTheme;
}

extension TextStyles on TextStyle {
  TextStyle asHint() => copyWith(
        color: color?.withOpacity(0.60),
      );

  TextStyle asBold() => copyWith(
        fontWeight: FontWeight.bold,
      );
  TextStyle asDisabled() => copyWith(
        color: color?.withOpacity(0.38),
      );
}

extension OpacityColors on Color {
  Color asHint() => Color(value).fadeBrightness(-0.1);

  Color asDisabled() => Color(value).fadeBrightness(-0.2);
}

extension IconSize on TextStyle {
  double get contextIconSize => switch (fontSize) {
        null => 25,
        _ => fontSize! * 0.9,
      };
}

extension ColorFader on Color {
  Color fadeBrightness(double factor) {
    assert(factor >= -1.0 && factor <= 1.0,
        'Factor value must be between -1.0 and 1.0');

    final hslColor = HSLColor.fromColor(this);
    final newHslColor = hslColor.withLightness(
      (hslColor.lightness + factor).clamp(0.0, 1.0),
    );
    return newHslColor.toColor();
  }
}
