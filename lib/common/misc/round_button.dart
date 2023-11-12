import 'package:diohub/utils/utils.dart';
import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({
    required this.icon,
    super.key,
    this.color,
    this.onPressed,
    this.padding = const EdgeInsets.all(8),
    this.onLongPress,
    this.margin = const EdgeInsets.all(8),
  });
  final Icon icon;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final Color? color;
  final EdgeInsets padding;
  final EdgeInsets margin;
  @override
  Widget build(final BuildContext context) => Padding(
        padding: margin,
        child: RawMaterialButton(
          onPressed: onPressed,
          onLongPress: onLongPress,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shape: const CircleBorder(),
          constraints: const BoxConstraints(),
          padding: padding,
          fillColor: color ?? context.themeData.iconTheme.color,
          child: IconTheme(
            data: IconThemeData(
              size: 18,
              color: context.colorScheme.onPrimary,
            ),
            child: icon,
          ),
        ),
      );
}
