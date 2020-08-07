import 'dart:convert';

class Utils {
  Utils._();

  /// parse token
  static Map<String, dynamic> parseJwt(String token) {
    if (token == null) return null;
    final parts = token.split('&');
    if (parts.length != 2) {
      return null;
    }

    final payload = parts[1];
    var normalized = base64Url.normalize(payload);
    var resp = utf8.decode(base64Url.decode(normalized));
    final payloadMap = json.decode(resp);
    if (payloadMap is! Map<String, dynamic>) {
      return null;
    }
    return payloadMap;
  }

  static hexToInt(String fullString) {
    fullString = fullString.replaceAll("-", "");
    String data = "";
    for (int i = 0; i <= fullString.length - 8; i += 8) {
      final hex = fullString.substring(i, i + 8);

      final number = int.parse(hex, radix: 16);
      data += number.toString();
    }
    return data;
  }

//
}
