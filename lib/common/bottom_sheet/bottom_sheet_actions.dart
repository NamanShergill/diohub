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

class URLActions {
  URLActions({
    required this.uri,
    this.shareDescription,
    this.showOpenAction = true,
  });
  final bool showOpenAction;
  final String? shareDescription;
  final Uri uri;
  List<PullDownMenuEntry> get menuItems => <PullDownMenuEntry>[
        PullDownMenuTitle(
          title: Text(
            uri.toString(),
          ),
        ),
        PullDownMenuActionsRow.medium(
          items: <PullDownMenuItem>[
            PullDownMenuItem(
              onTap: () async {
                await copyToClipboard(
                  uri.toString(),
                );
              },
              title: 'Copy',
              icon: Icons.copy,
            ),
            PullDownMenuItem(
              onTap: () async {
                String shareText;
                if (shareDescription != null) {
                  shareText = '$shareDescription\n$uri';
                } else {
                  shareText = uri.toString();
                }
                // final RenderBox? box = context.findRenderObject() as RenderBox?;
                await Share.share(
                  shareText,
                  // sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
                );
              },
              icon: Icons.adaptive.share,
              title: 'Share',
            ),
          ],
        ),
        if (isDeepLink(
              uri.toString(),
            ) &&
            showOpenAction)
          PullDownMenuActionsRow.medium(
            items: <PullDownMenuItem>[
              if (isDeepLink(
                    uri.toString(),
                  ) &&
                  showOpenAction) ...<PullDownMenuItem>[
                PullDownMenuItem(
                  onTap: openInApp,
                  title: 'Open in App',
                  icon: Octicons.apps,
                ),
                PullDownMenuItem(
                  onTap: launchURLInBrowser,
                  title: 'Open in Browser',
                  icon: Octicons.apps,
                ),
              ],
            ],
          ),
      ];

  Future<void> openInApp() async {
    if (!isDeepLink(
      uri.toString(),
    )) {
      throw Exception('Not a deep link');
    }
    await deepLinkNavigate(
      uri,
    );
  }

  Future<void> launchURL() {
    if (isDeepLink(
      uri.toString(),
    )) {
      return openInApp();
    } else {
      return launchURLInBrowser();
    }
  }

  Future<void> launchURLInBrowser() async {
    await canLaunchUrl(uri).then(
      (final bool value) async {
        if (value) {
          await launchUrl(uri);
        } else {
          ResponseHandler.setErrorMessage(
            AppPopupData(title: 'Unable to open URL'),
          );
        }
      },
    );
  }

  Future<void> showMenu(final BuildContext context) async {
    await showPullDownMenu(
      context: context,
      items: menuItems,
      position: context._getRect,
    );
  }
}

// Future<T?> showURLActions<T>(
//   final BuildContext context, {
//   required final Uri uri,
//   final bool showOpenAction = true,
//   final String? shareDescription,
// }) =>
//     showActionsSheet<T>(
//       context,
//       title: Text(
//         uri.toString(),
//       ),
//       // message: Text('URL Actions'),
//       actions: (final BuildContext context) => <BottomSheetAction>[
//         if (showOpenAction &&
//             !isDeepLink(
//               uri.toString(),
//             ))
//           BottomSheetAction(
//             title: const Text('Open'),
//             trailing: Icon(
//               MdiIcons.link,
//             ),
//             isDefaultAction: true,
//             onPressed: () {
//               canLaunchUrl(uri).then(
//                 (final bool value) async {
//                   if (context.mounted) {
//                     Navigator.pop(context);
//                   }
//                   if (value) {
//                     await launchUrl(uri);
//                   } else {
//                     ResponseHandler.setErrorMessage(
//                       AppPopupData(title: 'Unable to open URL'),
//                     );
//                   }
//                 },
//               );
//             },
//           ),
//         if (showOpenAction &&
//             isDeepLink(
//               uri.toString(),
//             )) ...<BottomSheetAction>[
//           BottomSheetAction(
//             title: const Text('Open in App'),
//             trailing: const AppLogoWidget(size: 25),
//             isDefaultAction: true,
//             onPressed: () {
//               if (context.mounted) {
//                 Navigator.pop(context);
//               }
//
//               deepLinkNavigate(
//                 uri,
//               );
//             },
//           ),
//           BottomSheetAction(
//             title: const Text('Open in Browser'),
//             trailing: Icon(
//               MdiIcons.link,
//             ),
//             // isDefaultAction: true,
//             onPressed: () {
//               canLaunchUrl(uri).then(
//                 (final bool value) {
//                   if (context.mounted) {
//                     Navigator.pop(context);
//                   }
//                   if (value) {
//                     launchUrl(uri);
//                   } else {
//                     ResponseHandler.setErrorMessage(
//                       AppPopupData(title: 'Unable to open URL'),
//                     );
//                   }
//                 },
//               );
//             },
//           ),
//         ],
//         BottomSheetAction(
//           title: const Text('Copy'),
//           trailing: const Icon(
//             Icons.copy,
//           ),
//           onPressed: () {
//             if (context.mounted) {
//               Navigator.pop(context);
//             }
//             copyToClipboard(
//               uri.toString(),
//             );
//           },
//         ),
//         BottomSheetAction(
//           title: const Text('Share'),
//           trailing: Icon(
//             Icons.adaptive.share,
//           ),
//           onPressed: () async {
//             String shareText;
//             if (shareDescription != null) {
//               shareText = '$shareDescription\n$uri';
//             } else {
//               shareText = uri.toString();
//             }
//             final RenderBox? box = context.findRenderObject() as RenderBox?;
//             await Share.share(
//               shareText,
//               sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
//             );
//             if (context.mounted) {
//               Navigator.pop(context);
//             }
//           },
//         ),
//       ],
//     );

extension RectExtension on BuildContext {
  /// Shorthand for `context.findRenderObject()! as RenderBox`
  RenderBox get currentRenderBox => findRenderObject()! as RenderBox;

  /// Given a [BuildContext], return the [Rect] of the corresponding
  /// [RenderBox]'s paintBounds in global coordinates.
  ///
  /// If [Rect]'s height is bigger than the screen size, additionally normalize
  /// [Rect] to help mitigate possible layout issues.
  Rect get _getRect {
    final RenderBox renderBoxContainer = currentRenderBox;
    final MediaQueryData queryData = MediaQuery.of(this);
    final Size size = queryData.size;

    final Rect rect = Rect.fromPoints(
      renderBoxContainer.localToGlobal(
        renderBoxContainer.paintBounds.topLeft,
      ),
      renderBoxContainer.localToGlobal(
        renderBoxContainer.paintBounds.bottomRight,
      ),
    );

    if (rect.size.height > size.height) {
      return _normalizeLargeRect(rect, size, queryData.padding);
    }

    return rect;
  }
}

/// Apply some additional adjustments on [Rect] from [RectExtension._getRect] if
/// [rect] is bigger than [size].
Rect _normalizeLargeRect(
  Rect rect,
  Size size,
  EdgeInsets padding,
) {
  const double minimumAllowedSize = kMinInteractiveDimensionCupertino * 2;

  final bool topIsNegative = rect.top.isNegative;
  final double height = size.height;
  final double rectBottom = rect.bottom;

  double? top;
  double? bottom;

  if (topIsNegative && rectBottom > height) {
    top = height * 0.65;
    bottom = height * 0.75;
  } else if (topIsNegative && rectBottom < height) {
    final double diff = height - rectBottom - padding.bottom;

    if (diff < minimumAllowedSize) {
      top = rectBottom;
      bottom = height - padding.bottom;
    }
  } else {
    final double diff = rect.top - padding.top;

    if (diff < minimumAllowedSize) {
      top = padding.top;
      bottom = rect.top;
    }
  }

  return Rect.fromLTRB(
    rect.left,
    top ?? rect.top,
    rect.right,
    bottom ?? rect.bottom,
  );
}
