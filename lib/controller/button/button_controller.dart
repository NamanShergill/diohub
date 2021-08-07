import 'dart:async';

final StreamController<bool> _buttonValueController =
    StreamController<bool>.broadcast();

Stream get buttonStream => _buttonValueController.stream;

void setButtonValue({required bool value}) {
  _buttonValueController.add(value);
}

void dispose() {
  _buttonValueController.close();
}
