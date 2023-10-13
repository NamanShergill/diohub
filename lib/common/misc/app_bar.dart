import 'package:dio_hub/common/bottom_sheet/url_actions.dart';
import 'package:dio_hub/common/misc/menu_button.dart';
import 'package:dio_hub/common/wrappers/editing_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DHAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DHAppBar({
    required this.title,
    super.key,
    this.url,
    this.hasEditableChildren = false,
  });
  final String? url;
  final Widget title;
  final bool hasEditableChildren;
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(final BuildContext context) => AppBar(
        title: title,
        elevation: 0,
        actions: <Widget>[
          if (url != null) ShareButton(url!),
          if (hasEditableChildren)
            IconButton(
              onPressed: () {
                final EditingProvider editingState =
                    context.read<EditingProvider>();
                if (editingState.editingState != EditingState.editMode) {
                  editingState.editMode();
                } else {
                  editingState.viewMode();
                }
              },
              icon: const Icon(Icons.edit),
            ),
        ],
      );
}

class ShareButton extends StatelessWidget {
  const ShareButton(this.url, {super.key});
  final String url;

  @override
  Widget build(final BuildContext context) => MenuButton(
        itemBuilder: (final BuildContext context) => URLActions(
          uri: Uri.parse(url),
          showOpenAction: false,
        ).menuItems,
      );
}
