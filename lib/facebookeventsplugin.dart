import 'dart:async';

import 'package:flutter/services.dart';

class Facebookeventsplugin {
  static const MethodChannel _channel =
      const MethodChannel('facebookeventsplugin');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
