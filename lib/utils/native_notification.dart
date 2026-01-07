import 'package:flutter/services.dart';

class NativeNotification {
  static const _channel =
  MethodChannel('native_notifications');

  static Future<void> show({
    required String title,
    required String message,
  }) async {
    await _channel.invokeMethod('showNotification', {
      'title': title,
      'message': message,
    });
  }


  static Future<void> checkNotificationpermission() async {
    await _channel.invokeMethod('showNotification1');
  }
}
