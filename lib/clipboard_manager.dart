import 'dart:async';

import 'package:flutter/services.dart';

class ClipboardManager {
  static Future<bool> copyToClipBoard(String text) async {
    await Clipboard.setData(ClipboardData(text: text));
    return true;
  }
}
