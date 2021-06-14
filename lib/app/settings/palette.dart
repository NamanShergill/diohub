import 'dart:convert';

import 'package:dio_hub/app/settings/base.dart';
import 'package:flutter/material.dart';

class PaletteSettings extends Settings<DioHubPalette> {
  PaletteSettings() : super('app_palette', defaultSetting: DioHubPalette());

  @override
  String toPrefData() {
    return jsonEncode(currentSetting.toJson());
  }

  @override
  DioHubPalette toType(String data) {
    return DioHubPalette.fromJson(jsonDecode(data));
  }
}

class DioHubPalette {
  final Color? _accent;
  final Color? _background;
  // static Color background = Color(0xff151618);
  final Color? _onBackground;
  final Color? _baseElements;
  final Color? _elementsOnColors;
  final Color? _red;
  final Color? _green;
  final Color? _faded1;
  final Color? _faded2;
  final Color? _faded3;

  Color get accent => _accent ?? _defaultPalette.accent;
  Color get background => _background ?? _defaultPalette.background;
  Color get onBackground => _onBackground ?? _defaultPalette.onBackground;
  Color get baseElements => _baseElements ?? _defaultPalette.baseElements;
  Color get elementsOnColors =>
      _elementsOnColors ?? _defaultPalette.elementsOnColors;
  Color get green => _green ?? _defaultPalette.green;
  Color get red => _red ?? _defaultPalette.red;
  Color get faded1 => _faded1 ?? _defaultPalette.faded1;
  Color get faded2 => _faded2 ?? _defaultPalette.faded2;
  Color get faded3 => _faded3 ?? _defaultPalette.faded3;

  DioHubPalette({
    Color? accent,
    Color? background,
    Color? onBackground,
    Color? baseElements,
    Color? elementsOnColors,
    Color? green,
    Color? red,
    Color? faded1,
    Color? faded2,
    Color? faded3,
  })  : _accent = accent,
        _background = background,
        _onBackground = onBackground,
        _baseElements = baseElements,
        _elementsOnColors = elementsOnColors,
        _green = green,
        _red = red,
        _faded1 = faded1,
        _faded2 = faded2,
        _faded3 = faded3;

  factory DioHubPalette.fromJson(Map<String, dynamic> json) => DioHubPalette(
        accent: _getColor(json, 'accent'),
        background: _getColor(json, 'background'),
        onBackground: _getColor(json, 'onBackground'),
        baseElements: _getColor(json, 'baseElements'),
        elementsOnColors: _getColor(json, 'elementsOnColors'),
        green: _getColor(json, 'green'),
        red: _getColor(json, 'red'),
        faded1: _getColor(json, 'faded1'),
        faded2: _getColor(json, 'faded2'),
        faded3: _getColor(json, 'faded3'),
      );

  DioHubPalette copyWith({
    Color? accent,
    Color? background,
    Color? onBackground,
    Color? baseElements,
    Color? elementsOnColors,
    Color? green,
    Color? red,
    Color? faded1,
    Color? faded2,
    Color? faded3,
  }) =>
      DioHubPalette(
          accent: accent ?? _accent,
          background: background ?? _background,
          onBackground: onBackground ?? _onBackground,
          baseElements: baseElements ?? _baseElements,
          elementsOnColors: elementsOnColors ?? _elementsOnColors,
          green: green ?? _green,
          red: red ?? _red,
          faded1: faded1 ?? _faded1,
          faded2: faded2 ?? _faded2,
          faded3: faded3 ?? _faded3);

  Map<String, String?> toJson() => {
        'accent': _accent?.value.toRadixString(16),
        'background': _background?.value.toRadixString(16),
        'onBackground': _onBackground?.value.toRadixString(16),
        'baseElements': _baseElements?.value.toRadixString(16),
        'elementsOnColors': _elementsOnColors?.value.toRadixString(16),
        'green': _green?.value.toRadixString(16),
        'red': _red?.value.toRadixString(16),
        'faded1': _faded1?.value.toRadixString(16),
        'faded2': _faded2?.value.toRadixString(16),
        'faded3': _faded3?.value.toRadixString(16),
      };
}

Color? _getColor(Map<String, dynamic> json, String key) {
  if (int.tryParse('0x${json[key]}') != null) {
    return Color(int.parse('0x${json[key]}'));
  }
}

final DioHubPalette _defaultPalette = DioHubPalette(
  accent: Color(0xff0079FD),
  background: Color(0xff17181C),
  onBackground: Color(0xff201f23),
  baseElements: Colors.white,
  elementsOnColors: Colors.white,
  green: Color(0xff27AE61),
  red: Color(0xffF44E3B),
  faded1: Color(0xff413E3E),
  faded2: Color(0xff555555),
  faded3: Color(0xff878787),
);
