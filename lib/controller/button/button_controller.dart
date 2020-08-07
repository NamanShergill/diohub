import 'dart:async';

class ButtonController {
  static final StreamController<bool> _buttonValueController =
      StreamController<bool>.broadcast();

  static Stream get buttonStream => _buttonValueController.stream;

  static setButtonValue(bool value) {
    _buttonValueController.add(value);
  }

  static dispose() {
    _buttonValueController.close();
  }
}
