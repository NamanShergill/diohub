import 'dart:io';

import 'package:dio_hub/app/api_handler/response_handler.dart';
import 'package:dio_hub/app/settings/palette.dart';
import 'package:dio_hub/common/const/app_info.dart';
import 'package:dio_hub/controller/deep_linking_handler.dart';
import 'package:dio_hub/main.dart';
import 'package:dio_hub/models/popup/popup_type.dart';
import 'package:dio_hub/utils/copy_to_clipboard.dart';
import 'package:dio_hub/utils/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

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
      builder: (final context) => DHBottomSheet(
        headerBuilder: headerBuilder,
        builder: (final context, final setState) => BottomSheetBodyScrollable(
          scrollBuilder: (final context, final scrollController) =>
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
          builder: (final context, final setState) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 4,
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Container(
                  decoration: BoxDecoration(
                    color: context.palette.faded1,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  height: 4,
                  width: context.mediaQuery.size.width * 0.1,
                ),
              ),
              if (headerBuilder != null) ...[
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
              const Divider(
                height: 0,
              ),
              Flexible(child: builder.call(context, setState)),
              const SizedBox(
                height: 8,
              ),
            ],
          ),
        ),
      );
}
