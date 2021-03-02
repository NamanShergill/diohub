import 'package:flutter/widgets.dart';
import 'package:onehub/models/enums/status_enum.dart';

class BaseProvider extends ChangeNotifier {
  bool _busy = false;
  bool get busy => _busy;

  Status _status = Status.initialized;
  Status get status => _status;

  String error;

  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }
}
