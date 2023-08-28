import 'package:dio_hub/common/bottom_sheet/bottom_sheets.dart';
import 'package:dio_hub/controller/deep_linking_handler.dart';
import 'package:flutter/material.dart';

Future<void> linkHandler(
  final BuildContext context,
  final String? url, {
  final String? shareDescription,
  final bool showSheetOnDeepLink = false,
  final bool showOpenActions = true,
}) async {
  // print(isDeepLink(url!));
  if (isDeepLink(url!) && !showSheetOnDeepLink) {
    deepLinkNavigate(
      Uri.parse(url),
    );
  } else {
    await showURLActions(
      context,
      showOpenAction: showOpenActions,
      uri: Uri.parse(url),
      shareDescription: shareDescription,
    );
  }
}
