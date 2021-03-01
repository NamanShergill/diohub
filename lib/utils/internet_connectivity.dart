import 'dart:async';

import 'package:connectivity/connectivity.dart';

enum NetworkStatus { Online, Offline, Restored }

class InternetConnectivity {
  static final StreamController _networkController =
      StreamController<NetworkStatus>.broadcast();

  static Stream<NetworkStatus> get networkStream => _networkController.stream;

  static networkStatusService() async {
    if (await Connectivity().checkConnectivity() == ConnectivityResult.none) {
      _networkController.add(NetworkStatus.Offline);
    }
    Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult status) async {
      print(status);
      if (status != ConnectivityResult.none) {
        _networkController.add(NetworkStatus.Restored);
        await Future.delayed(Duration(seconds: 5));
        if (status != ConnectivityResult.none)
          _networkController.add(NetworkStatus.Online);
      } else {
        _networkController.add(NetworkStatus.Offline);
      }
    });
  }

  void dispose() {
    _networkController.close();
  }
}
