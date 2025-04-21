import 'package:flutter/services.dart';

class IosBroadcastActivityPlugin {
  static const _methodChannel = MethodChannel(
      "com.yullg.flutter.media_capture/broadcast_activity_method");

  static Future<void> start({
    String? preferredExtension,
  }) async {
    await _methodChannel.invokeMethod("start", {
      "preferredExtension": preferredExtension,
    });
  }
}
