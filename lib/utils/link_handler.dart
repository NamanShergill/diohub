import 'package:dio_hub/common/bottom_sheet/bottom_sheets.dart';
import 'package:dio_hub/controller/deep_linking_handler.dart';
import 'package:flutter/material.dart';

void linkHandler(
  BuildContext context,
  String? url, {
  String? shareDescription,
  bool showSheetOnDeepLink = false,
  bool showOpenActions = true,
}) async {
  // print(isDeepLink(url!));
  if (isDeepLink(url!) && !showSheetOnDeepLink) {
    deepLinkNavigate(
      Uri.parse(url),
    );
  } else {
    showURLActions(
      context,
      showOpenAction: showOpenActions,
      uri: Uri.parse(url),
      shareDescription: shareDescription,
    );
  }
}
