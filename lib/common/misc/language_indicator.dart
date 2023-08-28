import 'package:dio_hub/utils/lang_colors/get_language_color.dart';
import 'package:flutter/material.dart';

class LanguageIndicator extends StatelessWidget {
  const LanguageIndicator(
    this.language, {
    this.size = 16,
    this.textStyle,
    super.key,
  });
  final String? language;
  final double size;
  final TextStyle? textStyle;
  @override
  Widget build(final BuildContext context) => Padding(
        padding: EdgeInsets.all(size / 6),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color(
                  int.parse(
                    getLangColor(language).replaceFirst('#', '0xFF'),
                  ),
                ),
                shape: BoxShape.circle,
              ),
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
