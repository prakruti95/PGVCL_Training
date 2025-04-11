import 'dart:async';
import 'package:flutter/services.dart';

class ShakeDetectionPlugin {
  static const MethodChannel _channel = MethodChannel('shake_detection_plugin');

  static StreamController<String> _shakeController = StreamController<String>();

  static Stream<String> get shakeStream => _shakeController.stream;

  static Future<void> startShakeDetection() async {
    _channel.setMethodCallHandler((MethodCall call) async {
      if (call.method == 'onShake') {
        _shakeController.add('shakeDetected');
      }
    });
    await _channel.invokeMethod('startShakeDetection');
  }
}
