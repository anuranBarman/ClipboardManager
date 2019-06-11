import 'dart:async';

import 'package:flutter/services.dart';

class ClipboardManager {
  static const MethodChannel _channel =
      const MethodChannel('clipboard_manager');

  static Future<bool> copyToClipBoard(String text) async {
    final bool result = await _channel.invokeMethod('copyToClipBoard',
    <String,String>{
      'text':text
    });
    return result;
  }

  static Future<String> copyFromClipBoard() async {
    final String result = await _channel.invokeMethod('copyFromClipBoard');
    return result;
  }
}
