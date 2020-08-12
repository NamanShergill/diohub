import 'dart:async';

import 'package:gitapp/app/global.dart';
import 'package:gitapp/common/popup/popup_helper.dart';
import 'package:gitapp/models/popup/popup_type.dart';

class ResponseHandler {
  ResponseHandler._();

  static final StreamController _errorController =
      StreamController<AppPopupData>.broadcast();
  static final StreamController _successController =
      StreamController<AppPopupData>.broadcast();

  static Stream<AppPopupData> get _errorStream => _errorController.stream;
  static Stream<AppPopupData> get _successStream => _successController.stream;

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
      if (error != null) {
        error.popupType = PopupType.failed;
        DialogHelper.appPopup(
          Global.navKey.currentContext,
          error,
        );
      }
    });
  }

  static getSuccessStream() {
    _successStream.listen((success) {
      if (success != null) {
        success.popupType = PopupType.success;
        DialogHelper.appPopup(
          Global.navKey.currentContext,
          success,
        );
      }
    });
  }
}
