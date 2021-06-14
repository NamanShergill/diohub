import 'dart:convert';

import 'package:dio_hub/app/global.dart';
import 'package:flutter/widgets.dart';

abstract class Settings<T> extends ChangeNotifier {
  late T currentSetting;
  final T defaultSetting;
  final String _path;
  final int _formatVer;
  Settings(String path, {required this.defaultSetting, int formatVer = 0})
      : _path = path,
        _formatVer = formatVer {
    // Global.sharedPrefs.remove(_path);
    try {
      String? data = Global.sharedPrefs.getString(_path);
      if (data != null) {
        final content = jsonDecode(data);
        if (content['format_version'] == _formatVer) {
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

  _saveSettings() {
    Global.sharedPrefs.setString(_path, _toStr());
  }

  updateData(T data) {
    currentSetting = data;
    _saveSettings();
    notifyListeners();
  }

  T toType(String data);

  String toPrefData();

  void resetToDefault() {
    Global.sharedPrefs.remove(_path);
  }

  String _toStr() {
    return jsonEncode({
      'format_version': _formatVer,
      'data': toPrefData(),
    });
  }
}
