import 'dart:async';

class ButtonController {
  static final StreamController<bool> _buttonValueController =
      StreamController<bool>.broadcast();

  static Stream get buttonStream => _buttonValueController.stream;

  static void setButtonValue(bool value) {
    _buttonValueController.add(value);
  }

  static void dispose() {
    _buttonValueController.close();
  }
}
