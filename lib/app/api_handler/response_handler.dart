import 'dart:async';

import 'package:diohub/app/global.dart';
import 'package:diohub/common/popup/popup_helper.dart';
import 'package:diohub/models/popup/popup_type.dart';

class ResponseHandler {
  ResponseHandler._();

  static final StreamController<AppPopupData> _errorController =
      StreamController<AppPopupData>.broadcast();
  static final StreamController<AppPopupData> _successController =
      StreamController<AppPopupData>.broadcast();

  static Stream<AppPopupData> get _errorStream => _errorController.stream;
  static Stream<AppPopupData> get _successStream => _successController.stream;

  void dispose() {
    unawaited(_errorController.close());
    unawaited(_successController.close());
  }

  static void setErrorMessage(final AppPopupData popupData) {
    _errorController.add(popupData);
  }

  static void setSuccessMessage(final AppPopupData popupData) {
    _successController.add(popupData);
  }

  static void getErrorStream() {
    _errorStream.listen((final AppPopupData error) async {
      error.popupType = PopupType.failed;
      await DialogHelper.appPopup(
        currentContext,
        error,
      );
    });
  }

  static void getSuccessStream() {
    _successStream.listen((final AppPopupData success) async {
      success.popupType = PopupType.success;
      await DialogHelper.appPopup(
        currentContext,
        success,
      );
    });
  }
}
