import 'package:dio_hub/common/const/app_info.dart';
import 'package:dio_hub/controller/deep_linking_handler.dart';
import 'package:dio_hub/utils/copy_to_clipboard.dart';
import 'package:dio_hub/utils/open_in_app_browser.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:pull_down_button/pull_down_button.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

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
        PullDownMenuActionsRow.medium(
          items: <PullDownMenuItem>[
            if (isDeepLink(
                  uri.toString(),
                ) &&
                showOpenAction)
              PullDownMenuItem(
                onTap: openInApp,
                title: 'Open in App',
                iconWidget: const AppLogoWidget(
                  size: 25,
                ),
              ),
            PullDownMenuItem(
              onTap: launchURLInBrowser,
              title: _getOpenText,
              icon: _getOpenIcon,
            ),
          ],
        ),
      ];

  IconData get _getOpenIcon => switch (uri.scheme) {
        'mailto' => MdiIcons.email,
        _ => MdiIcons.openInNew,
      };
  String get _getOpenText => switch (uri.scheme) {
        'mailto' => 'Mail',
        _ => 'Open${isDeepLink(
            uri.toString(),
          ) ? ' in Browser' : ''}',
      };

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
    if (await ChromeSafariBrowser.isAvailable()) {
      await openInAppBrowser(uri);
    } else if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw Exception('Cannot launch url');
    }
  }

  Future<void> showMenu(final BuildContext context) async {
    await HapticFeedback.lightImpact();
    await showPullDownMenu(
      context: context,
      items: menuItems,
      position: context._getRect,
    );
  }
}

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
  final Rect rect,
  final Size size,
  final EdgeInsets padding,
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
