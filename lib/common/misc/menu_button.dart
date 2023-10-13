import 'package:dio_hub/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:pull_down_button/pull_down_button.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({
    required this.itemBuilder,
    super.key,
    this.buttonBuilder,
    this.onCanceled,
    this.position = PullDownMenuPosition.automatic,
    this.itemsOrder = PullDownMenuItemsOrder.automatic,
    this.buttonAnchor = PullDownMenuAnchor.center,
    // this.animationBuilder,
    this.menuOffset = 16,
    this.scrollController,
    this.routeTheme,
    this.builder,
  });

  final Widget Function(
    BuildContext context,
    Widget button,
    Future<void> Function() showMenu,
  )? builder;

  /// Called when the button is pressed to create the items to show in the menu.
  ///
  /// If items contain at least one tappable menu item of type
  /// [PullDownMenuItem.selectable] all of [PullDownMenuItem]s should also be of
  /// type [PullDownMenuItem.selectable].
  ///
  /// See https://developer.apple.com/design/human-interface-guidelines/components/menus-and-actions/pull-down-buttons
  ///
  /// In order to achieve it all [PullDownMenuItem]s will automatically switch
  /// to the "selectable" view.
  final PullDownMenuItemBuilder itemBuilder;

  /// Builder that provides [BuildContext] as well as the `showMenu` function to
  /// pass to any custom button
  final PullDownMenuButtonBuilder? buttonBuilder;

  /// Called when the user dismisses the pull-down menu.
  final PullDownMenuCanceled? onCanceled;

  /// Whether the pull-down menu is positioned above, over, or under the
  /// [buttonBuilder].
  ///
  /// Defaults to [PullDownMenuPosition.automatic] which makes the
  /// pull-down menu appear directly under or above the button that was used to
  /// create it (based on the side that has more space available).
  final PullDownMenuPosition position;

  /// Whether the pull-down menu orders its items from [itemBuilder] in a
  /// downward or upwards way.
  ///
  /// Defaults to [PullDownMenuItemsOrder.downwards].
  final PullDownMenuItemsOrder itemsOrder;

  /// Whether the pull-down menu is anchored to the center, left, or right side
  /// of the [buttonBuilder].
  ///
  /// If `null` no anchoring will be involved.
  ///
  /// Defaults to `null`.
  final PullDownMenuAnchor? buttonAnchor;

  /// Additional horizontal offset for the pull-down menu if the menu's desired
  /// position is not in the central third of the screen.
  ///
  /// If the menu's desired position is in the right side of the screen,
  /// [menuOffset] is added to said position (menu moves to the right). If the
  /// menu's desired position is in the left side of the screen, [menuOffset]
  /// is subtracted from said position (menu moves to the left).
  ///
  /// Consider using [buttonAnchor] if you want to offset the menu for a large
  /// amount of px.
  ///
  /// Defaults to 16px.
  final double menuOffset;

  /// A scroll controller that can be used to control the scrolling of the
  /// [itemBuilder] in the menu.
  ///
  /// If `null`, uses an internally created [ScrollController].
  final ScrollController? scrollController;

  /// Theme of the route used to display pull-down menu launched from this
  /// [PullDownButton].
  ///
  /// If this property is null, then [PullDownMenuRouteTheme] from
  /// [PullDownButtonTheme.routeTheme] is used.
  ///
  /// If that's null, then [PullDownMenuRouteTheme.defaults] is used.
  final PullDownMenuRouteTheme? routeTheme;

  @override
  Widget build(final BuildContext context) => PullDownButton(
        itemBuilder: itemBuilder,
        builder: builder,
        buttonBuilder: buttonBuilder ??
            (final BuildContext context, final VoidCallback showMenu) =>
                IconButton(
                  icon: Icon(
                    Icons.adaptive.more_rounded,
                  ),
                  onPressed: showMenu,
                ),
        itemsOrder: itemsOrder,
        onCanceled: onCanceled,
        buttonAnchor: buttonAnchor,
        // animationBuilder: animationBuilder,
        menuOffset: menuOffset,
        position: position,
        routeTheme: routeTheme,
        scrollController: scrollController,
      );
}

extension PullDownMenuHeaderThemed on PullDownMenuHeader {
  PullDownMenuHeader themed(final BuildContext context) => PullDownMenuHeader(
        title: title,
        leading: leading,
        onTap: onTap,
        itemTheme: (itemTheme ?? const PullDownMenuItemTheme()).copyWith(
          textStyle: context.textTheme.labelLarge,
          subtitleStyle: context.textTheme.labelMedium?.asHint(),
        ),
        subtitle: subtitle,
        icon: icon,
        key: key,
        iconWidget: iconWidget,
        tapHandler: tapHandler,
      );
}
