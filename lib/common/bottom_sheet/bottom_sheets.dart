import 'dart:io';

import 'package:dio_hub/app/Dio/response_handler.dart';
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
  BuildContext context, {
  bool enableDrag = false,
  bool isScrollControlled = false,
  required WidgetBuilder builder,
}) {
  return showModalBottomSheet<T>(
    enableDrag: enableDrag,
    // Notch obstructs sheet, https://github.com/flutter/flutter/issues/39205
    isScrollControlled: isScrollControlled,
    context: context,
    builder: builder,
  );
}

Future<T?> showScrollableBottomSheet<T>(BuildContext context,
    {bool enableDrag = false,
    required StatefulWidgetBuilder headerBuilder,
    required ScrollBuilder scrollableBodyBuilder}) {
  return showDHBottomSheet<T>(
    context,
    isScrollControlled: true,
    builder: (context) => DHBottomSheet(
      headerBuilder: headerBuilder,
      builder: (context, setState) => BottomSheetBodyScrollable(
        scrollBuilder: (context, scrollController) =>
            scrollableBodyBuilder.call(context, setState, scrollController),
      ),
    ),
  );
}

class DHBottomSheet extends StatelessWidget {
  const DHBottomSheet({
    Key? key,
    this.headerBuilder,
    this.titlePadding = const EdgeInsets.all(16),
    required this.builder,
  }) : super(key: key);
  final StatefulWidgetBuilder? headerBuilder;
  final StatefulWidgetBuilder builder;
  final EdgeInsets titlePadding;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: StatefulBuilder(
        builder: (context, setState) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 4,
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: context.palette.faded1,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  height: 4,
                  width: context.mediaQuery.size.width * 0.1,
                )),
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
            Flexible(
              child: builder.call(context, setState),
            ),
            const SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
  }
}
