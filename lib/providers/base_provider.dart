import 'package:flutter/widgets.dart';

class BaseProvider extends ChangeNotifier {
  bool _busy = false;
  bool get busy => _busy;

  /// Status of the providers extending [BaseProvider] for better state handling.
  Status _status = Status.initialized;
  Status get status => _status;

  String error;

  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }
}

enum Status { initialized, loading, loaded, error }
