import 'package:diohub/style/border_radiuses.dart';
import 'package:diohub/utils/utils.dart';
import 'package:flutter/material.dart';

class InkPot extends StatelessWidget {
  const InkPot({
    required this.child,
    super.key,
    this.onTap,
    this.onLongPress,
    this.borderRadius,
    this.backgroundColor,
  });

  final Widget child;
  final Color? backgroundColor;
  final GestureTapCallback? onTap;
  final GestureLongPressCallback? onLongPress;
  final BorderRadius? borderRadius;

  @override
  Widget build(final BuildContext context) {
    final BorderRadius? radius = borderRadius ??
        context.themeData.extension<BorderRadiusTheme>()?.inkwellBorderRadius;
    if (backgroundColor != null) {
      return Material(
        color: backgroundColor,
        borderRadius: radius,
        child: buildInkWell(radius),
      );
    }
    return buildInkWell(radius);
  }

  InkWell buildInkWell(final BorderRadius? radius) => InkWell(
        onTap: onTap,
        onLongPress: onLongPress,
        borderRadius: radius,
        child: child,
      );
}
