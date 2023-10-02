part of 'bottom_sheets.dart';

Future<T?> showActionsSheet<T>(
  final BuildContext context, {
  required final List<BottomSheetAction> Function(BuildContext context) actions,
  final Widget? title,
  final Widget? message,
  final Widget? cancelButton,
}) {
  if (Platform.isIOS) {
    return showCupertinoModalPopup<T>(
      context: context,

      // bottomSheetColor: context.paletteStatic.primary,
      builder: (final BuildContext context) => CupertinoActionSheet(
        title: title,
        message: message,
        cancelButton: cancelButton,
        actions: actions
            .call(context)
            .map(
              (final BottomSheetAction e) => CupertinoActionSheetAction(
                onPressed: e.onPressed,
                isDefaultAction: e.isDefaultAction,
                isDestructiveAction: e.isDestructiveAction,
                child: Theme(
                  data: context.themeData.copyWith(
                    iconTheme: IconThemeData(
                      color: e.isDestructiveAction
                          ? CupertinoDynamicColor.resolve(
                              CupertinoColors.systemRed,
                              context,
                            )
                          : CupertinoTheme.of(context).primaryColor,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      if (e.leading != null) ...<Widget>[
                        e.leading!,
                        const SizedBox(width: 15),
                      ],
                      e.title,
                      if (e.trailing != null) ...<Widget>[
                        const SizedBox(width: 10),
                        e.trailing!,
                      ],
                    ],
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
  return showDHBottomSheet(
    context,
    isScrollControlled: true,
    builder: (final BuildContext context) => DHBottomSheet(
      headerBuilder: title?.returnIfNotNull(
            (final BuildContext context, final StateSetter setState) => title,
          ) ??
          message?.returnIfNotNull(
            (final BuildContext context, final StateSetter setState) => message,
          ),
      builder: (final BuildContext context, final StateSetter setState) =>
          BottomSheetBodyList(
        children: actions
            .call(context)
            .map(
              (final BottomSheetAction e) => ListTile(
                title: e.title,
                leading: e.leading,
                trailing: e.trailing,
                onTap: () => e.onPressed,
              ),
            )
            .toList(),
      ),
    ),
  );
}

class BottomSheetAction {
  BottomSheetAction({
    required this.title,
    required this.onPressed,
    this.isDefaultAction = false,
    this.isDestructiveAction = false,
    this.trailing,
    this.leading,
  });

  /// The primary content of the action sheet.
  ///
  /// Typically a [Text] widget.
  ///
  /// This should not wrap. To enforce the single line limit, use
  /// [Text.maxLines].
  final Widget title;

  /// The callback that is called when the action item is tapped. (required)
  final VoidCallback onPressed;

  /// A widget to display after the title.
  ///
  /// Typically an [Icon] widget.
  final Widget? trailing;

  /// A widget to display before the title.
  ///
  /// Typically an [Icon] or a [CircleAvatar] widget.
  final Widget? leading;

  final bool isDefaultAction;

  final bool isDestructiveAction;
}

Future<T?> showURLActions<T>(
  final BuildContext context, {
  required final Uri uri,
  final bool showOpenAction = true,
  final String? shareDescription,
}) =>
    showActionsSheet<T>(
      context,
      title: Text(
        uri.toString(),
      ),
      // message: Text('URL Actions'),
      actions: (final BuildContext context) => <BottomSheetAction>[
        if (showOpenAction &&
            !isDeepLink(
              uri.toString(),
            ))
          BottomSheetAction(
            title: const Text('Open'),
            trailing: const Icon(
              LineIcons.link,
            ),
            isDefaultAction: true,
            onPressed: () {
              canLaunchUrl(uri).then(
                (final bool value) async {
                  if (context.mounted) {
                    Navigator.pop(context);
                  }
                  if (value) {
                    await launchUrl(uri);
                  } else {
                    ResponseHandler.setErrorMessage(
                      AppPopupData(title: 'Unable to open URL'),
                    );
                  }
                },
              );
            },
          ),
        if (showOpenAction &&
            isDeepLink(
              uri.toString(),
            )) ...<BottomSheetAction>[
          BottomSheetAction(
            title: const Text('Open in App'),
            trailing: const AppLogoWidget(size: 25),
            isDefaultAction: true,
            onPressed: () {
              if (context.mounted) {
                Navigator.pop(context);
              }

              deepLinkNavigate(
                uri,
              );
            },
          ),
          BottomSheetAction(
            title: const Text('Open in Browser'),
            trailing: const Icon(
              LineIcons.link,
            ),
            // isDefaultAction: true,
            onPressed: () {
              canLaunchUrl(uri).then(
                (final bool value) {
                  if (context.mounted) {
                    Navigator.pop(context);
                  }
                  if (value) {
                    launchUrl(uri);
                  } else {
                    ResponseHandler.setErrorMessage(
                      AppPopupData(title: 'Unable to open URL'),
                    );
                  }
                },
              );
            },
          ),
        ],
        BottomSheetAction(
          title: const Text('Copy'),
          trailing: const Icon(
            Icons.copy,
          ),
          onPressed: () {
            if (context.mounted) {
              Navigator.pop(context);
            }
            copyToClipboard(
              uri.toString(),
            );
          },
        ),
        BottomSheetAction(
          title: const Text('Share'),
          trailing: Icon(
            Icons.adaptive.share,
          ),
          onPressed: () async {
            String shareText;
            if (shareDescription != null) {
              shareText = '$shareDescription\n$uri';
            } else {
              shareText = uri.toString();
            }
            final RenderBox? box = context.findRenderObject() as RenderBox?;
            await Share.share(
              shareText,
              sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
            );
            if (context.mounted) {
              Navigator.pop(context);
            }
          },
        ),
      ],
    );
