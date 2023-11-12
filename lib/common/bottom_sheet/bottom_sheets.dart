import 'dart:io';

import 'package:diohub/common/wrappers/infinite_scroll_wrapper.dart';
import 'package:diohub/utils/extensions.dart';
import 'package:diohub/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

part 'bottom_sheet_actions.dart';
part 'bottom_sheet_bodies.dart';
part 'bottom_sheet_headers.dart';

Future<T?> showDHBottomSheet<T>(
  final BuildContext context, {
  required final WidgetBuilder builder,
  final bool enableDrag = false,
  final bool isScrollControlled = false,
}) =>
    showModalBottomSheet<T>(
      backgroundColor: context.colorScheme.background,
      enableDrag: enableDrag,
      // Notch obstructs sheet, https://github.com/flutter/flutter/issues/39205
      isScrollControlled: isScrollControlled,
      context: context,
      builder: builder,
    );

Future<T?> showScrollableBottomSheet<T>(
  final BuildContext context, {
  required final StatefulWidgetBuilder headerBuilder,
  required final ScrollBuilder scrollableBodyBuilder,
  final bool enableDrag = false,
}) =>
    showDHBottomSheet<T>(
      context,
      isScrollControlled: true,
      builder: (final BuildContext context) => DHBottomSheet(
        headerBuilder: headerBuilder,
        builder: (final BuildContext context, final StateSetter setState) =>
            BottomSheetBodyScrollable(
          scrollBuilder: (
            final BuildContext context,
            final ScrollController scrollController,
          ) =>
              scrollableBodyBuilder.call(context, setState, scrollController),
        ),
      ),
    );

class DHBottomSheet extends StatelessWidget {
  const DHBottomSheet({
    required this.builder,
    super.key,
    this.headerBuilder,
    this.titlePadding = const EdgeInsets.all(16),
  });
  final StatefulWidgetBuilder? headerBuilder;
  final StatefulWidgetBuilder builder;
  final EdgeInsets titlePadding;

  @override
  Widget build(final BuildContext context) => SafeArea(
        child: StatefulBuilder(
          builder: (final BuildContext context, final StateSetter setState) =>
              Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SizedBox(
                height: 4,
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Container(
                  decoration: BoxDecoration(
                    // color: context.palette.faded1,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  height: 4,
                  width: context.mediaQuery.size.width * 0.1,
                ),
              ),
              if (headerBuilder != null) ...<Widget>[
                Padding(
                  padding: titlePadding,
                  child: Center(
                    child: headerBuilder!.call(context, setState),
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
              ],
              Flexible(child: builder.call(context, setState)),
              const SizedBox(
                height: 8,
              ),
            ],
          ),
        ),
      );
}

class BottomSheetPagination<T> {
  BottomSheetPagination({
    required this.paginatedListItemBuilder,
    required this.paginationFuture,
    required this.title,
  });

  final ScrollWrapperBuilder<T> paginatedListItemBuilder;
  final ScrollWrapperFuture<T> paginationFuture;
  final String title;

  Future<T?> openSheet(
    final BuildContext context,
  ) =>
      showScrollableBottomSheet<T>(
        context,
        headerBuilder: (
          final BuildContext context,
          final StateSetter setState,
        ) =>
            BottomSheetHeaderText(
          headerText: title,
        ),
        scrollableBodyBuilder: (
          final BuildContext context,
          final StateSetter setState,
          final ScrollController scrollController,
        ) =>
            InfiniteScrollWrapper<T>(
          future: paginationFuture,
          scrollController: scrollController,
          builder: paginatedListItemBuilder,
        ),
      );
}
