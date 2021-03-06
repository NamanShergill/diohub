import 'package:flutter/material.dart';

class LanguageIndicator extends StatelessWidget {
  final String language;
  final double size;
  LanguageIndicator(this.language, {this.size = 16});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(size / 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration:
                BoxDecoration(color: Colors.orange, shape: BoxShape.circle),
            height: size,
            width: size,
          ),
          SizedBox(
            width: size / 2,
          ),
          Text(
            language,
            style: TextStyle(fontSize: size / 1.1),
          ),
        ],
      ),
    );
  }
}
