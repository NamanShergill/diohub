import 'package:dio_hub/app/settings/palette.dart';
import 'package:dio_hub/main.dart';
import 'package:flutter/material.dart';

class InkWellCard extends StatelessWidget {
  const InkWellCard({
    Key? key,
    required this.onTap,
    required this.child,
    this.enabled = true,
    this.padding = const EdgeInsets.all(16),
    this.color,
    this.borderRadius,
  }) : super(key: key);
  final VoidCallback? onTap;
  final Widget child;
  final bool enabled;
  final EdgeInsets padding;
  final Color? color;
  final BorderRadius? borderRadius;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      color: color ?? context.palette.secondary,
      shape: context.themeData.cardTheme.shape,
      elevation: enabled ? context.themeData.cardTheme.elevation ?? 1 : 0,
      child: InkWell(
        customBorder: context.themeData.cardTheme.shape,
        onTap: enabled ? onTap : null,
        child: Padding(padding: padding, child: child),
      ),
    );
  }
}
