import 'package:dio_hub/style/border_radiuses.dart';
import 'package:dio_hub/utils/copy_to_clipboard.dart';
import 'package:dio_hub/utils/utils.dart';
import 'package:flutter/material.dart';

class CopyButton extends StatefulWidget {
  const CopyButton(this.data, {super.key, this.size = 24});
  final String data;
  final double size;

  @override
  CopyButtonState createState() => CopyButtonState();
}

class CopyButtonState extends State<CopyButton> {
  bool copied = false;

  Future<void> copy() async {
    setState(() {
      copied = true;
    });
    await copyToClipboard(widget.data);
    await Future<void>.delayed(const Duration(seconds: 4));
    setState(() {
      copied = false;
    });
  }

  @override
  Widget build(final BuildContext context) => InkWell(
        borderRadius: smallBorderRadius,
        onTap: copied ? null : copy,
        child: Padding(
          padding: EdgeInsets.all(widget.size / 2),
          child: Icon(
            copied ? Icons.check_rounded : Icons.copy_rounded,
            size: widget.size,
            color: context.colorScheme.onSurface.withOpacity(copied ? 1 : 0.5),
          ),
        ),
      );
}
