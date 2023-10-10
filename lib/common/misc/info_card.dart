import 'package:dio_hub/common/bottom_sheet/bottom_sheets.dart';
import 'package:dio_hub/common/misc/tappable_card.dart';
import 'package:dio_hub/utils/utils.dart';
import 'package:flex_list/flex_list.dart';
import 'package:flutter/material.dart';

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
    this.mode = InfoCardMode.basic,
    this.title,
    this.leading,
    this.childPadding,
    this.backgroundColor,
    // this.titleTextStyle,
    // this.leadingIconColor,
  }) : assert(
          title != null || leading != null,
          'Provide at least one descriptor.',
        );
  final Widget child;
  final VoidCallback? onTap;
  final Widget? trailing;
  final InfoCardMode mode;
  final EdgeInsets? childPadding;
  final String? title;
  final Color? backgroundColor;
  final Widget? leading;
  // final Color? leadingIconColor;
  // final TextStyle? titleTextStyle;

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
        size: 18,
        color: color,
      );
  Widget _buildUI(final BuildContext context) {
    switch (mode) {
      case InfoCardMode.basic:
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Flexible(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  _buildDescriptors(context),
                  const SizedBox(
                    width: 4,
                  ),
                  Flexible(
                    child: Padding(
                      padding: childPadding ??
                          const EdgeInsets.symmetric(horizontal: 4),
                      child: child,
                    ),
                  ),
                ],
              ),
            ),
            _buildTrailingWidget(),
          ],
        );
      case InfoCardMode.expanded:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _buildDescriptors(context),
                  _buildTrailingWidget(),
                ],
              ),
            ),
            const Divider(
              thickness: 0.1,
            ),
            const SizedBox(
              height: 8,
            ),
            Flexible(
              child: Padding(
                padding: childPadding ?? EdgeInsets.zero,
                child: child,
              ),
            ),
          ],
        );
    }
  }

  Row _buildDescriptors(final BuildContext context) => Row(
        children: <Widget>[
          if (leading != null)
            Theme(
              data: context.themeData.copyWith(
                iconTheme: context.themeData.iconTheme.copyWith(
                  // size: 18,
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
            Text(title!, style: context.textTheme.bodyMedium?.asHint()
                // .copyWith(fontWeight: FontWeight.bold),
                ),
        ],
      );

  Widget _buildTrailingWidget() => onTap != null
      ? Padding(
          padding: const EdgeInsets.only(left: 4),
          child: trailing ??
              Icon(
                Icons.adaptive.arrow_forward_rounded,
                size: 15,
              ),
        )
      : Container();

  @override
  Widget build(final BuildContext context) => InkWellCard(
        onTap: onTap,
        color: backgroundColor,
        child: _buildUI(context),
      );
}

enum InfoCardMode { basic, expanded }

class MultiItemInfoCard<T> extends StatelessWidget {
  const MultiItemInfoCard({
    required this.availableList,
    required this.title,
    required this.builder,
    required this.bottomSheetPagination,
    this.onTapOnLengthOverrides = const <int, VoidCallback?>{},
    this.iconOnLengthOverrides = const <int, Icon?>{},
    this.infoCardMode = InfoCardMode.basic,
    super.key,
    this.childPadding,
    this.leading,
    // this.titleTextStyle,
    this.multiListSingleItemBehaviour,
    this.onTapOverride,
    this.trailingWidgetOverride,
    // this.onTap,
  });
  final BottomSheetPagination<NodeWithPaginationInfo<T>> bottomSheetPagination;
  final EdgeInsets? childPadding;
  final InfoCardMode infoCardMode;
  final Widget? leading;
  // final TextStyle? titleTextStyle;
  // final VoidCallback? onTap;
  final MultiItemInfoCardList<T> availableList;
  final String title;
  final Widget Function(
      BuildContext context, MultiItemInfoCardList<T> availableList) builder;

  /// Overrides the cards onTap behaviour for specific list lengths.
  final Map<int, VoidCallback?> onTapOnLengthOverrides;

  /// Overrides the cards onTap behaviour for specific list lengths.
  final Map<int, Icon?> iconOnLengthOverrides;

  final MultiListSingleItemBehaviour? multiListSingleItemBehaviour;

  final VoidCallback? onTapOverride;
  final Widget? trailingWidgetOverride;

  List<T> get items => availableList.limitedAvailableList;

  int get listLength => availableList.totalCount;
  Widget? get _trailingIcon {
    if (trailingWidgetOverride != null) {
      return trailingWidgetOverride;
    } else if (onTapOnLengthOverrides.containsKey(listLength)) {
      return iconOnLengthOverrides[listLength];
    } else if (multiListSingleItemBehaviour != null && listLength == 1) {
      return multiListSingleItemBehaviour!.icon;
    }
    return switch (listLength) {
      0 => null,
      _ => const Icon(
          Icons.arrow_drop_down_rounded,
        ),
    };
  }

  VoidCallback? _defaultOnTap(final BuildContext context) {
    if (onTapOverride != null) {
      return onTapOverride;
    } else if (onTapOnLengthOverrides.containsKey(listLength)) {
      return onTapOnLengthOverrides[listLength];
    } else if (multiListSingleItemBehaviour != null && listLength == 1) {
      return multiListSingleItemBehaviour!.onTap?.call(context);
    }
    return switch (listLength) {
      0 => null,
      _ => () async => bottomSheetPagination.openSheet(context),
    };
  }

  @override
  Widget build(final BuildContext context) => InfoCard(
        mode: infoCardMode,
        trailing: _trailingIcon,
        onTap: _defaultOnTap(context),
        title: title,
        leading: leading,
        childPadding: childPadding,
        // titleTextStyle: titleTextStyle,
        child: builder.call(context, availableList),
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

class MultiItemInfoCardList<T> {
  MultiItemInfoCardList({
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

class MultiListSingleItemBehaviour {
  MultiListSingleItemBehaviour({
    required this.onTap,
    required this.icon,
  });

  final VoidCallback Function(BuildContext context)? onTap;
  final Icon? icon;
}
