import 'package:dio_hub/utils/lang_colors/get_language_color.dart';
import 'package:dio_hub/utils/utils.dart';
import 'package:flutter/material.dart';

class LanguageIndicator extends StatelessWidget {
  const LanguageIndicator(
    this.language, {
    this.size = 12,
    // this.textStyle,
    super.key,
  });
  final String? language;
  final double size;
  // final TextStyle? textStyle;
  @override
  Widget build(final BuildContext context) => Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
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
          const SizedBox(
            width: 8,
          ),
          Text(
            language ?? 'N/A',
            style: context.textTheme.bodySmall?.asHint(),
          ),
        ],
      );
}
