import 'package:dio_hub/utils/lang_colors/get_language_color.dart';
import 'package:flutter/material.dart';

class LanguageIndicator extends StatelessWidget {
  final String? language;
  final double size;
  final TextStyle? textStyle;
  const LanguageIndicator(this.language,
      {this.size = 16, this.textStyle, Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(size / 6),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                color: Color(int.parse(
                    getLangColor(language).replaceFirst('#', '0xFF'))),
                shape: BoxShape.circle),
            height: size,
            width: size,
          ),
          SizedBox(
            width: size / 2,
          ),
          Text(
            language ?? 'N/A',
            style: textStyle ?? TextStyle(fontSize: size / 1.1),
          ),
        ],
      ),
    );
  }
}
