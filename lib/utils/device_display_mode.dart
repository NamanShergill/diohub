import 'dart:developer';

import 'package:flutter_displaymode/flutter_displaymode.dart';

Future<void> setHighRefreshRate() async {
  try {
    await FlutterDisplayMode.setHighRefreshRate();
  } catch (e) {
    log('Error setting display mode', error: e);
  }
}
