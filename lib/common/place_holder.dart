import 'package:dio_hub/style/colors.dart';
import 'package:flutter/material.dart';

class TextPlaceHolder extends StatelessWidget {
  final String text;
  TextPlaceHolder(this.text);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          text,
          style: TextStyle(color: AppColor.grey3),
        ),
      ),
    );
  }
}
