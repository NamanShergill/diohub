import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:onehub/common/scaffold_body/scaffoldBody_controller.dart';
import 'package:onehub/common/scaffold_body/scaffold_body.dart';
import 'package:onehub/controller/notification_controller.dart';

class BaseProvider extends ChangeNotifier {
  //// Status of the providers extending [BaseProvider] for better state handling.
  Status _status = Status.initialized;
  Status get status => _status;

  /// StreamController for provider status.
  final StreamController<Status> _statusController =
      StreamController<Status>.broadcast();

  /// Get the latest stream of provider status.
  Stream<Status> get statusStream => _statusController.stream;

  /// Get the controller of provider status.
  StreamController<Status> get statusController => _statusController;

  /// Provide [ScaffoldBodyController] of the [ScaffoldBody] where relevant
  /// errors from the provider are to be show on.
  ScaffoldBodyController scaffoldBodyController;

  /// Show a popup notification on [ScaffoldBody] listening
  /// to the global stream if a [ScaffoldBodyController] is not provided.
  void showPopup(Widget data) {
    if (scaffoldBodyController != null)
      scaffoldBodyController.showPopupNotification(data);
    else
      PopupNotificationController.addPopUpNotification(data);
  }

  /// Dispose the stream.
  disposeStatusStream() {
    _statusController.close();
  }

  /// Error information, if any.
  String error;
}

enum Status { initialized, loading, loaded, error }
