import 'package:dio_hub/app/settings/palette.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TextPlaceHolder extends StatelessWidget {
  final String text;
  const TextPlaceHolder(this.text, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: TextStyle(
            color: Provider.of<PaletteSettings>(context).currentSetting.faded3),
      ),
    );
  }
}
