import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

enum NetworkStatus { online, offline, restored }

class InternetConnectivity {
  static final StreamController _networkController =
      StreamController<NetworkStatus>.broadcast();

  static Stream<NetworkStatus> get networkStream =>
      _networkController.stream as Stream<NetworkStatus>;

  static NetworkStatus _status = NetworkStatus.online;
  static NetworkStatus get status => _status;

  static void networkStatusService() async {
    Connectivity().onConnectivityChanged.listen((status) async {
      if (status != ConnectivityResult.none) {
        _networkController.add(NetworkStatus.restored);
        await Future.delayed(const Duration(seconds: 5));
        if (status != ConnectivityResult.none) {
          _networkController.add(NetworkStatus.online);
        }
      } else {
        _networkController.add(NetworkStatus.offline);
      }
    });
    _networkController.stream.listen((event) {
      _status = event;
    });
    if (await Connectivity().checkConnectivity() == ConnectivityResult.none) {
      _networkController.add(NetworkStatus.offline);
    }
  }

  void dispose() {
    _networkController.close();
  }
}
