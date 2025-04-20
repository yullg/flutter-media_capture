import Flutter
import UIKit

public class MediaCapturePlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
      BroadcastActivityPlugin.register(with: registrar)
  }
}
