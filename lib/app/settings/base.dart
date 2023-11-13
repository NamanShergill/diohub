import 'dart:async';
import 'dart:convert';

import 'package:diohub/app/global.dart';
import 'package:diohub/utils/type_cast.dart';
import 'package:flutter/widgets.dart';

abstract class Settings<T> extends ChangeNotifier {
  Settings(
    final String path, {
    required this.defaultSetting,
    this.formatVer = 0,
  }) : _path = path {
    // Global.sharedPrefs.remove(_path);
    try {
      final String? data = sharedPrefs.getString(_path);
      if (data != null) {
        final TypeMap content = jsonDecode(data);
        if (content['format_version'] == formatVer) {
          currentSetting = toType(content['data']);
        } else {
          unawaited(sharedPrefs.remove(_path));
          currentSetting = defaultSetting;
        }
      } else {
        currentSetting = defaultSetting;
      }
    } on Exception catch (e) {
      unawaited(sharedPrefs.remove(_path));
      currentSetting = defaultSetting;
    }
  }
  late T currentSetting;
  final T defaultSetting;
  final String _path;
  final int formatVer;

  Future<void> _saveSettings() async {
    await sharedPrefs.setString(_path, _toStr());
  }

  Future<void> updateData(final T data) async {
    currentSetting = data;
    await _saveSettings();
    notifyListeners();
  }

  T toType(final String data);

  String toPrefData();

  Future<void> resetToDefault() async {
    currentSetting = defaultSetting;
    await sharedPrefs.remove(_path);
    notifyListeners();
  }

  String _toStr() => jsonEncode(<String, Object>{
        'format_version': formatVer,
        'data': toPrefData(),
      });
}
