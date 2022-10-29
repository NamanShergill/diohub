import 'dart:convert';

import 'package:dio_hub/app/settings/base.dart';
import 'package:dio_hub/utils/to_hex_string.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  DioHubPalette({
    Color? accent,
    Color? primary,
    Color? secondary,
    Color? baseElements,
    Color? elementsOnColors,
    Color? green,
    Color? red,
    Color? faded1,
    Color? faded2,
    Color? faded3,
  })  : _accent = accent,
        _primary = primary,
        _secondary = secondary,
        _baseElements = baseElements,
        _elementsOnColors = elementsOnColors,
        _green = green,
        _red = red,
        _faded1 = faded1,
        _faded2 = faded2,
        _faded3 = faded3;

  factory DioHubPalette.fromJson(Map<String, dynamic> json) => DioHubPalette(
        accent: _getColor(json, 'accent'),
        primary: _getColor(json, 'primary'),
        secondary: _getColor(json, 'secondary'),
        baseElements: _getColor(json, 'baseElements'),
        elementsOnColors: _getColor(json, 'elementsOnColors'),
        // green: _getColor(json, 'green'),
        // red: _getColor(json, 'red'),
        faded1: _getColor(json, 'faded1'),
        faded2: _getColor(json, 'faded2'),
        faded3: _getColor(json, 'faded3'),
      );

  final Color? _accent;
  final Color? _primary;
  final Color? _secondary;
  final Color? _baseElements;
  final Color? _elementsOnColors;
  final Color? _red;
  final Color? _green;
  final Color? _faded1;
  final Color? _faded2;
  final Color? _faded3;

  Color get accent => _accent ?? _defaultPalette.accent;
  Color get primary => _primary ?? _defaultPalette.primary;
  Color get secondary => _secondary ?? _defaultPalette.secondary;
  Color get baseElements => _baseElements ?? _defaultPalette.baseElements;
  Color get elementsOnColors =>
      _elementsOnColors ?? _defaultPalette.elementsOnColors;
  Color get green => _green ?? _defaultPalette.green;
  Color get red => _red ?? _defaultPalette.red;
  Color get faded1 => _faded1 ?? _defaultPalette.faded1;
  Color get faded2 => _faded2 ?? _defaultPalette.faded2;
  Color get faded3 => _faded3 ?? _defaultPalette.faded3;

  DioHubPalette copyWith({
    Color? accent,
    Color? primary,
    Color? secondary,
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
          primary: primary ?? _primary,
          secondary: secondary ?? _secondary,
          baseElements: baseElements ?? _baseElements,
          elementsOnColors: elementsOnColors ?? _elementsOnColors,
          green: green ?? _green,
          red: red ?? _red,
          faded1: faded1 ?? _faded1,
          faded2: faded2 ?? _faded2,
          faded3: faded3 ?? _faded3);

  Map<String, String> toJson() => {
        if (_accent != null) 'accent': toHexString(_accent!),
        if (_primary != null) 'primary': toHexString(_primary!),
        if (_secondary != null) 'secondary': toHexString(_secondary!),
        if (_baseElements != null) 'baseElements': toHexString(_baseElements!),
        if (_elementsOnColors != null)
          'elementsOnColors': toHexString(_elementsOnColors!),
        if (_green != null) 'green': toHexString(_green!),
        if (_red != null) 'red': toHexString(_red!),
        if (_faded1 != null) 'faded1': toHexString(_faded1!),
        if (_faded2 != null) 'faded2': toHexString(_faded2!),
        if (_faded3 != null) 'faded3': toHexString(_faded3!),
      };
}

Color? _getColor(Map<String, dynamic> json, String key) {
  if (json[key] != null) {
    final hex = 'ff${(json[key] as String).substring(2)}';
    if (int.tryParse('0x$hex') != null) {
      return Color(int.parse('0x$hex'));
    } else {
      return null;
    }
  } else {
    return null;
  }
}

final DioHubPalette _defaultPalette = DioHubPalette(
  accent: const Color(0xff0079FD),
  primary: const Color(0xff17181C),
  secondary: const Color(0xff201f23),
  baseElements: Colors.white,
  elementsOnColors: Colors.white,
  green: const Color(0xff27AE61),
  red: const Color(0xffF44E3B),
  faded1: const Color(0xff413E3E),
  faded2: const Color(0xff555555),
  faded3: const Color(0xff878787),
);

extension PaletteExtension on BuildContext {
  DioHubPalette get palette =>
      Provider.of<PaletteSettings>(this).currentSetting;

  DioHubPalette get paletteStatic =>
      Provider.of<PaletteSettings>(this, listen: false).currentSetting;
}
