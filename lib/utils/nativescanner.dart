import 'package:flutter/services.dart';

class NativeQRScanner {
  static const MethodChannel _channel =
  MethodChannel('qr_scanner_channel');

  static Future<String?> openScanner() async {
    try {
      final result = await _channel.invokeMethod<String>('openQRScanner');
      return result;
    } catch (e) {
      print("QR Scan error: $e");
      return null;
    }
  }
}
