import 'dart:async';

import 'package:flutter/widgets.dart';

abstract class BaseDataProvider<T> extends BaseProvider {
  BaseDataProvider({Status? status, bool loadDataOnInit = true})
      : super(status) {
    if (loadDataOnInit) {
      loadData();
    }
  }

  late T data;

  Future<T> setInitData({bool isInitialisation = false});

  void onError(Object error) {}

  void loadData() async {
    loading();
    try {
      data = await setInitData(isInitialisation: true);
      loaded();
    } catch (e) {
      error(error: e);
      onError(e);
    }
  }
}

abstract class BaseProvider extends ChangeNotifier {
  BaseProvider([Status? status]) : _status = status ?? Status.initialized {
    // Update provider status based on the data sent to the stream.
    statusStream.listen((event) {
      _status = event;
      notifyListeners();
    });
  }

  //// Status of the providers extending [BaseProvider] for better state handling.
  Status _status;
  Status get status => _status;

  /// StreamController for provider status.
  final StreamController<Status> _statusController =
      StreamController<Status>.broadcast();

  /// Get the latest stream of provider status.
  Stream<Status> get statusStream => _statusController.stream;

  /// Dispose the stream.
  void disposeStreams() {
    _statusController.close();
  }

  // Set provider status to [Status.error] with a custom message.
  void error({Object? error}) {
    errorInfo = error;
    _statusController.add(Status.error);
  }

  // Set provider status to [Status.loading].
  void loading() {
    _statusController.add(Status.loading);
  }

  // Set provider status to [Status.loaded].
  void loaded() {
    _statusController.add(Status.loaded);
  }

  // Reset the provider.
  void reset() {
    _statusController.add(Status.initialized);
    errorInfo = null;
  }

  /// Error information, if any.
  Object? errorInfo;
}

enum Status { initialized, loading, loaded, error }
