import 'package:diohub/app/api_handler/response_handler.dart';
import 'package:diohub/models/popup/popup_type.dart';
import 'package:flutter/services.dart';

Future<void> copyToClipboard(final String text) async {
  await Clipboard.setData(
    ClipboardData(text: text),
  );
  ResponseHandler.setSuccessMessage(
    AppPopupData(title: 'Copied to clipboard.'),
  );
}
