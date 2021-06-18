import 'dart:convert';

class Utils {
  Utils._();

  static Map<String, dynamic>? parseJwt(String token) {
    final parts = token.split('&');
    if (parts.length != 2) {
      return null;
    }

    final payload = parts[1];
    var normalized = base64Url.normalize(payload);
    final resp = utf8.decode(base64Url.decode(normalized));
    final payloadMap = json.decode(resp);
    if (payloadMap is! Map<String, dynamic>) {
      return null;
    }
    return payloadMap;
  }

  static String hexToInt(String fullString) {
    String string = fullString.replaceAll("-", "");
    String data = "";
    for (int i = 0; i <= string.length - 8; i += 8) {
      final hex = string.substring(i, i + 8);

      final number = int.parse(hex, radix: 16);
      data += number.toString();
    }
    return data;
  }
}
