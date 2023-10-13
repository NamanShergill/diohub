import 'package:dio_hub/common/bottom_sheet/url_actions.dart';
import 'package:flutter/material.dart';

class LinkText extends StatelessWidget {
  const LinkText(this.link, {this.style, super.key, this.text});
  final TextStyle? style;
  final String? text;
  final String link;
  @override
  Widget build(final BuildContext context) {
    final URLActions urlActions = URLActions(uri: Uri.parse(link));
    return GestureDetector(
      onTap: urlActions.launchURL,
      onLongPress: () async {
        await urlActions.showMenu(context);
      },
      child: Text(
        text ?? link,
        style: const TextStyle(color: Colors.blue).merge(style),
      ),
    );
  }
}
