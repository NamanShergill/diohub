import 'dart:convert';

import 'package:dio_hub/app/global.dart';
import 'package:flutter/widgets.dart';

abstract class Settings<T> extends ChangeNotifier {
  late T currentSetting;
  final T defaultSetting;
  final String _path;
  final int formatVer;
  Settings(String path, {required this.defaultSetting, this.formatVer = 0})
      : _path = path {
    // Global.sharedPrefs.remove(_path);
    try {
      final String? data = Global.sharedPrefs.getString(_path);
      if (data != null) {
        final content = jsonDecode(data);
        if (content['format_version'] == formatVer) {
          currentSetting = toType(content['data']);
        } else {
          Global.sharedPrefs.remove(_path);
          currentSetting = defaultSetting;
        }
      } else {
        currentSetting = defaultSetting;
      }
    } catch (e) {
      Global.sharedPrefs.remove(_path);
      currentSetting = defaultSetting;
    }
  }

  void _saveSettings() {
    Global.sharedPrefs.setString(_path, _toStr());
  }

  void updateData(T data) {
    currentSetting = data;
    _saveSettings();
    notifyListeners();
  }

  T toType(String data);

  String toPrefData();

  void resetToDefault() {
    currentSetting = defaultSetting;
    Global.sharedPrefs.remove(_path);
    notifyListeners();
  }

  String _toStr() {
    return jsonEncode({
      'format_version': formatVer,
      'data': toPrefData(),
    });
  }
}
