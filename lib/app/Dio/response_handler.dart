import 'dart:async';

import 'package:dio_hub/app/global.dart';
import 'package:dio_hub/common/popup/popup_helper.dart';
import 'package:dio_hub/models/popup/popup_type.dart';

class ResponseHandler {
  ResponseHandler._();

  static final StreamController _errorController =
      StreamController<AppPopupData>.broadcast();
  static final StreamController _successController =
      StreamController<AppPopupData>.broadcast();

  static Stream<AppPopupData> get _errorStream =>
      _errorController.stream as Stream<AppPopupData>;
  static Stream<AppPopupData> get _successStream =>
      _successController.stream as Stream<AppPopupData>;

  dispose() {
    _errorController.close();
    _successController.close();
  }

  static setErrorMessage(AppPopupData popupData) {
    _errorController.add(popupData);
  }

  static setSuccessMessage(AppPopupData popupData) {
    _successController.add(popupData);
  }

  static getErrorStream() {
    _errorStream.listen((error) {
      error.popupType = PopupType.failed;
      DialogHelper.appPopup(
        Global.currentContext,
        error,
      );
    });
  }

  static getSuccessStream() {
    _successStream.listen((success) {
      success.popupType = PopupType.success;
      DialogHelper.appPopup(
        Global.currentContext,
        success,
      );
    });
  }
}
