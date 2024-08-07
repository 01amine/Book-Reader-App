import 'package:flutter/services.dart';

// dont use any package other than flutter/services
// you can use any class from flutter/services

class AppServices {
  static const MethodChannel channel = MethodChannel('samples.flutter.dev/');

  static Future<bool> checkConnectivity() async {
    final bool isOnline = await channel.invokeMethod('checkConnectivity');
    return isOnline;
  }
}
