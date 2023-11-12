import 'package:flutter/material.dart';

class TextPlaceHolder extends StatelessWidget {
  const TextPlaceHolder(this.text, {super.key});
  final String text;
  @override
  Widget build(final BuildContext context) => Padding(
        padding: const EdgeInsets.all(8),
        child: Text(
          text,
          style: const TextStyle(
              // color: Provider.of<PaletteSettings>(context).currentSetting.faded3,
              ),
        ),
      );
}
