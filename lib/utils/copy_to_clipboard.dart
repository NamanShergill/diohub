import 'package:flutter/services.dart';
import 'package:onehub/app/Dio/response_handler.dart';
import 'package:onehub/models/popup/popup_type.dart';

void copyToClipboard(String text) async {
  Clipboard.setData(ClipboardData(text: text));
  ResponseHandler.setSuccessMessage(
      AppPopupData(title: 'Copied to clipboard.'));
}
