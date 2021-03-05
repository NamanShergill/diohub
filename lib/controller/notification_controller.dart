import 'dart:async';

import 'package:flutter/cupertino.dart';

class PopupNotificationController {
  static final StreamController<Widget> _popupNotificationController =
      StreamController<Widget>.broadcast();

  static Stream<Widget> get popupNotificationStream =>
      _popupNotificationController.stream;

  static addPopUpNotification(Widget value) {
    _popupNotificationController.add(value);
  }

  static dispose() {
    _popupNotificationController.close();
  }
}
