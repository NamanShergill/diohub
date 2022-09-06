import 'package:dio_hub/app/settings/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/shims/dart_ui.dart';

class RoundButton extends StatelessWidget {
  const RoundButton(
      {Key? key,
      required this.icon,
      this.color,
      this.onPressed,
      this.padding,
      this.onLongPress})
      : super(key: key);
  final Icon icon;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final Color? color;
  final EdgeInsets? padding;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      onLongPress: onLongPress,
      style: ButtonStyle(
        shape: MaterialStateProperty.all(const CircleBorder()),
        minimumSize: MaterialStateProperty.all(const Size(6, 6)),
        padding: MaterialStateProperty.all(padding ?? const EdgeInsets.all(10)),
        backgroundColor:
            MaterialStateProperty.all(color ?? context.palette.accent),
      ),
      child: IconTheme(
        data: IconThemeData(size: 18, color: context.palette.baseElements),
        child: icon,
      ),
    );
  }
}
