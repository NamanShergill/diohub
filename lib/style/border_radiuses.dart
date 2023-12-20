import 'package:flutter/material.dart';

class BorderRadiusTheme extends ThemeExtension<BorderRadiusTheme> {
  BorderRadiusTheme({
    final BorderRadius? inkwellBorderRadius,
    final BorderRadius? medBorderRadius,
    final BorderRadius? smallBorderRadius,
  })  : inkwellBorderRadius = inkwellBorderRadius ?? _defaultBorderRadius,
        medBorderRadius = medBorderRadius ?? _defaultBorderRadius,
        smallBorderRadius = smallBorderRadius ?? BorderRadius.circular(8);

  static final BorderRadius _defaultBorderRadius = BorderRadius.circular(12);

  final BorderRadius inkwellBorderRadius;

  final BorderRadius medBorderRadius;
  final BorderRadius smallBorderRadius;

  @override
  BorderRadiusTheme copyWith({
    final BorderRadius? inkwellBorderRadius,
    final BorderRadius? medBorderRadius,
    final BorderRadius? smallBorderRadius,
  }) =>
      BorderRadiusTheme(
        inkwellBorderRadius: inkwellBorderRadius ?? this.inkwellBorderRadius,
        medBorderRadius: medBorderRadius ?? this.medBorderRadius,
        smallBorderRadius: smallBorderRadius ?? this.smallBorderRadius,
      );

  @override
  BorderRadiusTheme lerp(
    final BorderRadiusTheme other,
    final double t,
  ) =>
      BorderRadiusTheme(
        inkwellBorderRadius: BorderRadius.lerp(
          inkwellBorderRadius,
          other.inkwellBorderRadius,
          t,
        ),
        medBorderRadius: BorderRadius.lerp(
          medBorderRadius,
          other.medBorderRadius,
          t,
        ),
        smallBorderRadius: BorderRadius.lerp(
          smallBorderRadius,
          other.smallBorderRadius,
          t,
        ),
      );
}

extension BorderRadiusThemeEx on ThemeData {
  BorderRadiusTheme? get borderRadiusTheme => extension<BorderRadiusTheme>();
}
