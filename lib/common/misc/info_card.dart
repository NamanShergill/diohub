import 'package:dio_hub/common/misc/menu_button.dart';
import 'package:dio_hub/common/misc/tappable_card.dart';
import 'package:dio_hub/utils/utils.dart';
import 'package:flex_list/flex_list.dart';
import 'package:flutter/material.dart';
import 'package:pull_down_button/pull_down_button.dart';

class WrappedCollection extends StatelessWidget {
  const WrappedCollection({
    required this.children,
    super.key,
    this.spacing = 8,
  });
  final List<Widget> children;
  final double spacing;
  @override
  Widget build(final BuildContext context) => FlexList(
        // crossAxisAlignment: WrapCrossAlignment.center,
        verticalSpacing: spacing,
        horizontalSpacing: spacing,
        // runAlignment: WrapAlignment.center,
        children: children,
      );
}

class InfoCard extends StatelessWidget {
  const InfoCard({
    required this.child,
    this.onTap,
    this.trailing,
    super.key,
    this.title,
    this.leading,
    this.childPadding,
    this.headerPadding =
        const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
    this.onHeaderTap,
    // this.titleTextStyle,
    // this.leadingIconColor,
  }) : assert(
          title != null || leading != null,
          'Provide at least one descriptor.',
        );
  final Widget child;
  final VoidCallback? onTap;
  final VoidCallback? onHeaderTap;
  final Widget? trailing;
  final EdgeInsets? childPadding;
  final String? title;
  final Widget? leading;
  final EdgeInsets headerPadding;

  static Icon get dropdownTrailingIcon => const Icon(
        Icons.arrow_drop_down_rounded,
      );

  static Icon leadingIcon({
    required final IconData icon,
    required final BuildContext context,
    final Color? color,
  }) =>
      Icon(
        icon,
        // size: 18,
        color: color,
      );
  Widget _buildUI(final BuildContext context) => IntrinsicWidth(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            CardHeader(
              onTap: onHeaderTap ?? onTap,
              child: Padding(
                padding: headerPadding,
                child: Row(
                  // mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    _buildDescriptors(context),
                    if (trailing != null) trailing!,
                  ],
                ),
              ),
            ),
            BasicCard.linked(
              cardLinkType: CardLinkType.atTop,
              onTap: onTap,
              child: Padding(
                padding: childPadding ?? const EdgeInsets.all(12),
                child: Row(
                  children: <Widget>[
                    Flexible(child: child),
                  ],
                ),
              ),
            ),
          ],
        ),
      );

  Row _buildDescriptors(final BuildContext context) => Row(
        children: <Widget>[
          if (leading != null)
            Theme(
              data: context.themeData.copyWith(
                iconTheme: context.themeData.iconTheme.copyWith(
                  size: 16,
                  color: context.colorScheme.onSurface.asHint(),
                ),
              ),
              child: DefaultTextStyle(
                style: context.textTheme.bodyMedium!.asHint().copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                child: leading!,
              ),
            ),
          if (title != null && leading != null)
            const SizedBox(
              width: 8,
            ),
          if (title != null)
            Text(
              title!, style: context.textTheme.bodyMedium?.asHint(),
              // .copyWith(fontWeight: FontWeight.bold),
            ),
        ],
      );

  @override
  Widget build(final BuildContext context) => _buildUI(context);
}

class MenuInfoCard extends StatelessWidget {
  const MenuInfoCard({
    required this.title,
    required this.child,
    required this.menuBuilder,
    this.onTap,
    super.key,
    this.childPadding,
    this.leading,
    this.headerPadding =
        const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
    // this.titleTextStyle,
    // this.onTap,
  });
  final VoidCallback? onTap;
  final EdgeInsets? childPadding;
  final EdgeInsets headerPadding;
  final Widget? leading;
  // final TextStyle? titleTextStyle;
  // final VoidCallback? onTap;
  final String title;
  final List<PullDownMenuEntry> Function(BuildContext context) menuBuilder;
  final Widget child;

  @override
  Widget build(final BuildContext context) {
    final List<PullDownMenuEntry> menuItems = menuBuilder.call(context);
    if (menuItems.isNotEmpty) {
      return MenuButton(
        itemBuilder: menuBuilder,
        buttonBuilder: (final BuildContext context, final showMenu) => SizedBox(
          height: 25,
          width: 25,
          child: IconButton(
            onPressed: showMenu,
            icon: Icon(
              Icons.adaptive.more_rounded,
            ),
            padding: const EdgeInsets.all(4),
            // constraints: const BoxConstraints(),
          ),
        ),
        builder:
            (final BuildContext context, final Widget button, final showMenu) =>
                GestureDetector(
          onLongPress: showMenu,
          child: InfoCard(
            trailing: button,
            onTap: onTap, onHeaderTap: showMenu,
            title: title,
            leading: leading, headerPadding: headerPadding,
            childPadding: childPadding,
            // titleTextStyle: titleTextStyle,
            child: child,
          ),
        ),
      );
    }
    return InfoCard(
      onTap: onTap,
      title: title,
      childPadding: childPadding,
      leading: leading,
      child: child,
    );
  }
}

class CardHeader extends StatelessWidget {
  const CardHeader({
    required this.child,
    super.key,
    this.cardLinkType = CardLinkType.atBottom,
    this.menuItems = const <PullDownMenuItem>[],
    this.onTap,
  });

  final CardLinkType cardLinkType;
  final Widget child;
  final List<PullDownMenuItem> menuItems;
  final VoidCallback? onTap;
  @override
  Widget build(final BuildContext context) => BasicCard.linked(
        cardLinkType: cardLinkType,
        color: context.colorScheme.surfaceVariant,
        // elevation: 0,
        onTap: onTap,
        child: DefaultTextStyle(
          style: context.textTheme.bodySmall!.copyWith(
            color: context.colorScheme.onSurfaceVariant,
          ),
          child: IconTheme.merge(
            data: IconThemeData(
              color: context.colorScheme.onSurfaceVariant,
              size: 16,
            ),
            child: child,
          ),
        ),
      );
}

// abstract class InfoCardAdapter {
//   String get title;
//
//   bool get isExpanded;
//
//   WidgetBuilder get viewBuilder;
//
//   VoidCallback? onTap(final BuildContext context);
// }

// abstract class PaginatedInfoCardAdapter<T> extends InfoCardAdapter {
//   PaginatedInfoCardAdapter({
//     required this.availableList,
//     required this.singleItemBehavior,
//     this.iconOnLengthOverrides = const <int, Icon?>{},
//     this.onTapOnLengthOverrides = const <int, VoidCallback?>{},
//   });
//
//   Icon? get trailingIcon {
//     if (onTapOnLengthOverrides.containsKey(listLength)) {
//       return iconOnLengthOverrides[listLength];
//     } else if (singleItemBehavior != null && listLength == 1) {
//       return singleItemBehavior!.icon;
//     }
//     return switch (listLength) {
//       0 => null,
//       _ => const Icon(
//           Icons.arrow_drop_down_rounded,
//         ),
//     };
//   }
//
//   BottomSheetPagination<NodeWithPaginationInfo<T>> get paginatedSheet;
//
//   @override
//   VoidCallback? onTap(final BuildContext context) {
//     if (onTapOnLengthOverrides.containsKey(listLength)) {
//       return onTapOnLengthOverrides[listLength];
//     } else if (singleItemBehavior != null && listLength == 1) {
//       return singleItemBehavior!.onTap?.call(context);
//     }
//     return switch (listLength) {
//       0 => null,
//       _ => () async => paginatedSheet.openSheet(context),
//     };
//   }
//
//   final SingleItemConfigForMultiListAdapter? singleItemBehavior;
//
//   /// Overrides the cards onTap behaviour for specific list lengths.
//   final Map<int, VoidCallback?> onTapOnLengthOverrides;
//
//   /// Overrides the cards onTap behaviour for specific list lengths.
//   final Map<int, Icon?> iconOnLengthOverrides;
//
//   final MultiItemInfoCardList<T> availableList;
//
//   List<T> get items => availableList.limitedAvailableList;
//
//   int get listLength => availableList.totalCount;
// }

class UnfinishedList<T> {
  UnfinishedList({
    required this.limitedAvailableList,
    final int? totalCount,
  }) : totalCount = totalCount ?? limitedAvailableList.length;
  final int totalCount;
  final List<T> limitedAvailableList;

  bool get isComplete => totalCount == limitedAvailableList.length;
}

class NodeWithPaginationInfo<T> {
  NodeWithPaginationInfo({
    required this.node,
    required this.cursor,
    // this.totalCount,
  });
  NodeWithPaginationInfo.pageKey({
    required this.node,
    required final int pageKey,
    // this.totalCount,
  }) : cursor = pageKey.toString();
  factory NodeWithPaginationInfo.fromEdge(final Object edge) =>
      NodeWithPaginationInfo<T>(
        // ignore: avoid_dynamic_calls
        node: (edge as dynamic).node!,
        // ignore: avoid_dynamic_calls
        cursor: (edge as dynamic).cursor,
      );

  final T node;
  // final int? totalCount;
  final String cursor;

  @Deprecated(
    'This is for backwards compatibility with the REST API pagination ONLY!',
  )
  int? get cursorAsPageKey => int.tryParse(cursor);
}
