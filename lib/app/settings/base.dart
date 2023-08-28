import 'dart:convert';

import 'package:dio_hub/app/global.dart';
import 'package:flutter/widgets.dart';

abstract class Settings<T> extends ChangeNotifier {
  Settings(final String path,
      {required this.defaultSetting, this.formatVer = 0,})
      : _path = path {
    // Global.sharedPrefs.remove(_path);
    try {
      final data = sharedPrefs.getString(_path);
      if (data != null) {
        final content = jsonDecode(data);
        if (content['format_version'] == formatVer) {
          currentSetting = toType(content['data']);
        } else {
          sharedPrefs.remove(_path);
          currentSetting = defaultSetting;
        }
      } else {
        currentSetting = defaultSetting;
      }
    } catch (e) {
      sharedPrefs.remove(_path);
      currentSetting = defaultSetting;
    }
  }
  late T currentSetting;
  final T defaultSetting;
  final String _path;
  final int formatVer;

  void _saveSettings() {
    sharedPrefs.setString(_path, _toStr());
  }

  void updateData(final T data) {
    currentSetting = data;
    _saveSettings();
    notifyListeners();
  }

  T toType(final String data);

  String toPrefData();

  void resetToDefault() {
    currentSetting = defaultSetting;
    sharedPrefs.remove(_path);
    notifyListeners();
  }

  String _toStr() => jsonEncode({
        'format_version': formatVer,
        'data': toPrefData(),
      });
}
