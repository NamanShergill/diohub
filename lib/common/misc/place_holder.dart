import 'package:dio_hub/style/colors.dart';
import 'package:flutter/material.dart';

class TextPlaceHolder extends StatelessWidget {
  final String text;
  const TextPlaceHolder(this.text, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: TextStyle(color: AppColor.grey3),
      ),
    );
  }
}
