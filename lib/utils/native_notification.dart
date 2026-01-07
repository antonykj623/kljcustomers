import 'package:flutter/services.dart';

class NativeNotification {
  static const MethodChannel _channel =
  MethodChannel('native_notifications');

  /// Show a native Android notification
  static Future<void> show({
    required String title,
    required String message,
  }) async {
    await _channel.invokeMethod('showNotification', {
      'title': title,
      'message': message,
    });
  }

  /// Request notification permission (Android 13+)
  static Future<void> requestPermission() async {
    await _channel.invokeMethod('requestNotificationPermission');
  }
}
