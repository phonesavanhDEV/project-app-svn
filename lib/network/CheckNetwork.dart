import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

class InternetConnectivity {
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  Future<bool> checkInternetConnectivity() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      return true;
    } else {
      return false;
    }
  }

  void startMonitoringConnectivity(Function(bool) onConnectivityChanged) {
    _connectivitySubscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        onConnectivityChanged(true);
      } else {
        onConnectivityChanged(false);
      }
    });
  }

  void stopMonitoringConnectivity() {
    _connectivitySubscription.cancel();
  }
}
