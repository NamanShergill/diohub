import 'dart:async';

import 'package:flutter/widgets.dart';

class BaseProvider extends ChangeNotifier {
  BaseProvider() {
    // Update provider status based on the data sent to the stream.
    statusStream.listen((event) {
      if (event == Status.initialized) resetProvider();
      _status = event;
      notifyListeners();
    });
  }

  //// Status of the providers extending [BaseProvider] for better state handling.
  Status _status = Status.initialized;
  Status get status => _status;

  /// StreamController for provider status.
  final StreamController<Status> _statusController =
      StreamController<Status>.broadcast();

  /// StreamController for provider notifications.
  final StreamController<Widget?> _notificationController =
      StreamController<Widget?>.broadcast();

  /// Get the latest stream of provider status.
  Stream<Status> get statusStream => _statusController.stream;

  /// Get the controller of provider status.
  StreamController<Status> get statusController => _statusController;

  /// Get the controller of provider notifications.
  StreamController<Widget?> get notificationController =>
      _notificationController;

  /// Show a popup notification on [ScaffoldBody] listening
  /// to the global stream if a [ScaffoldBodyController] is not provided.
  void showPopup(Widget? data) {
    notificationController.add(data);
  }

  /// Dispose the stream.
  disposeStreams() {
    _statusController.close();
    _notificationController.close();
  }

  // Reset the provider.
  void resetProvider() {
    _status = Status.initialized;
    error = null;
  }

  /// Error information, if any.
  String? error;
}

enum Status { initialized, loading, loaded, error }
