import 'package:dio_hub/style/border_radiuses.dart';
import 'package:dio_hub/utils/link_handler.dart';
import 'package:flutter/material.dart';

class LinkText extends StatelessWidget {
  const LinkText(this.link, {this.style, super.key, this.text});
  final TextStyle? style;
  final String? text;
  final String link;
  @override
  Widget build(final BuildContext context) => Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: smallBorderRadius,
          onTap: () async {
            await linkHandler(context, link);
          },
          onLongPress: () async {
            await linkHandler(context, link, showSheetOnDeepLink: true);
          },
          child: Text(
            text ?? link,
            style: const TextStyle(color: Colors.blue).merge(style),
          ),
        ),
      );
}
