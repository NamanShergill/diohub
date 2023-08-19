part of 'bottom_sheets.dart';

Future<T?> showActionsSheet<T>(
  BuildContext context, {
  required List<BottomSheetAction> actions,
  Widget? title,
  Widget? message,
  Widget? cancelButton,
}) {
  if (Platform.isIOS) {
    return showCupertinoModalPopup<T>(
      context: context,

      // bottomSheetColor: context.paletteStatic.primary,
      builder: (context) => CupertinoActionSheet(
        title: title,
        message: message,
        cancelButton: cancelButton,
        actions: actions
            .map(
              (e) => CupertinoActionSheetAction(
                onPressed: e.onPressed,
                isDefaultAction: e.isDefaultAction,
                isDestructiveAction: e.isDestructiveAction,
                child: Theme(
                  data: context.themeData.copyWith(
                    iconTheme: IconThemeData(
                      color: e.isDestructiveAction
                          ? CupertinoDynamicColor.resolve(
                              CupertinoColors.systemRed, context)
                          : CupertinoTheme.of(context).primaryColor,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (e.leading != null) ...[
                        e.leading!,
                        const SizedBox(width: 15),
                      ],
                      e.title,
                      if (e.trailing != null) ...[
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
    builder: (context) => DHBottomSheet(
      headerBuilder: title?.returnIfNotNull(
            (context, setState) => title,
          ) ??
          message?.returnIfNotNull(
            (context, setState) => message,
          ),
      builder: (context, setState) => BottomSheetBodyList(
          children: actions
              .map(
                (e) => ListTile(
                  title: e.title,
                  leading: e.leading,
                  trailing: e.trailing,
                  onTap: () => e.onPressed,
                ),
              )
              .toList()),
    ),
  );
}

class BottomSheetAction {
  BottomSheetAction({
    this.isDefaultAction = false,
    this.isDestructiveAction = false,
    required this.title,
    required this.onPressed,
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

Future showURLActions<T>(
  BuildContext context, {
  required Uri uri,
  bool showOpenAction = true,
  String? shareDescription,
}) {
  return showActionsSheet<T>(
    context,
    title: Text(
      uri.toString(),
    ),
    // message: Text('URL Actions'),
    actions: [
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
              (value) {
                Navigator.pop(context);
                if (value) {
                  launchUrl(uri);
                } else {
                  ResponseHandler.setErrorMessage(
                      AppPopupData(title: 'Unable to open URL'));
                }
                Navigator.pop(context);
              },
            );
          },
        ),
      if (showOpenAction &&
          isDeepLink(
            uri.toString(),
          )) ...[
        BottomSheetAction(
          title: const Text('Open in App'),
          trailing: const AppLogoWidget(size: 25),
          isDefaultAction: true,
          onPressed: () {
            Navigator.pop(context);

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
              (value) {
                Navigator.pop(context);
                if (value) {
                  launchUrl(uri);
                } else {
                  ResponseHandler.setErrorMessage(
                      AppPopupData(title: 'Unable to open URL'));
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
          Navigator.pop(context);
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
        onPressed: () {
          String shareText;
          if (shareDescription != null) {
            shareText = '$shareDescription\n$uri';
          } else {
            shareText = uri.toString();
          }
          final box = context.findRenderObject() as RenderBox?;
          Share.share(
            shareText,
            sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
          );
          Navigator.pop(context);
        },
      ),
    ],
  );
}
