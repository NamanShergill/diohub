import 'package:dio_hub/app/settings/palette.dart';
import 'package:dio_hub/style/border_radiuses.dart';
import 'package:dio_hub/utils/copy_to_clipboard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CopyButton extends StatefulWidget {
  const CopyButton(this.data, {Key? key, this.size = 24}) : super(key: key);
  final String data;
  final double size;

  @override
  _CopyButtonState createState() => _CopyButtonState();
}

class _CopyButtonState extends State<CopyButton> {
  bool copied = false;

  void copy() async {
    setState(() {
      copied = true;
    });
    copyToClipboard(widget.data);
    await Future.delayed(const Duration(seconds: 4));
    setState(() {
      copied = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        borderRadius: smallBorderRadius,
        onTap: copied ? null : copy,
        child: Padding(
          padding: EdgeInsets.all(widget.size / 2),
          child: Icon(
            copied ? Icons.check_rounded : Icons.copy_rounded,
            size: widget.size,
            color: copied
                ? Provider.of<PaletteSettings>(context)
                    .currentSetting
                    .baseElements
                : Provider.of<PaletteSettings>(context).currentSetting.faded3,
          ),
        ));
  }
}
