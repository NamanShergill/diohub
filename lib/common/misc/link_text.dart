import 'package:dio_hub/style/border_radiuses.dart';
import 'package:dio_hub/utils/link_handler.dart';
import 'package:flutter/material.dart';

class LinkText extends StatelessWidget {
  final TextStyle? style;
  final String text;
  final String link;
  const LinkText(this.text, {this.style, Key? key, required this.link})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: AppThemeBorderRadius.smallBorderRadius,
      onTap: () {
        linkHandler(context, link);
      },
      onLongPress: () {
        linkHandler(context, link, showSheetOnDeepLink: true);
      },
      child: Text(
        text,
        style: (style ?? const TextStyle()).copyWith(color: Colors.blue),
      ),
    );
  }
}
