import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';
class SharedPref {
  // Singleton pattern
  static const MethodChannel _channel =
  MethodChannel('native_prefs');

  static Future<void> setString(String key, String value) async {
    await _channel.invokeMethod('setString', {
      'key': key,
      'value': value,
    });
  }

  static Future<String?> getString(String key) async {
    final result = await _channel.invokeMethod<String>(
      'getString',
      {'key': key},
    );
    return result;
  }
}
