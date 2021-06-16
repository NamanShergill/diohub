import 'package:dio_hub/utils/link_handler.dart';
import 'package:flutter/material.dart';

class DHAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? url;
  final Widget title;
  const DHAppBar({Key? key, this.url, required this.title}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      elevation: 0,
      actions: [
        if (url != null) ShareButton(url!),
      ],
    );
  }
}

class ShareButton extends StatelessWidget {
  final String url;
  const ShareButton(this.url, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        iconSize: 20,
        onPressed: () {
          linkHandler(context, url, showSheetOnDeepLink: true);
        },
        icon: const Icon(Icons.share));
  }
}
