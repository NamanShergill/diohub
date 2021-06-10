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
      actions: [
        if (url != null)
          IconButton(
              onPressed: () {
                linkHandler(context, url, showSheetOnDeepLink: true);
              },
              icon: const Icon(Icons.share))
      ],
    );
  }
}
