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