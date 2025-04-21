import Flutter
import UIKit
import Foundation
import ReplayKit

public class BroadcastActivityPlugin: NSObject, FlutterPlugin {
    
    public static func register(with registrar: FlutterPluginRegistrar) {
      let methodChannel = FlutterMethodChannel(
          name: "com.yullg.flutter.media_capture/broadcast_activity_method",
          binaryMessenger: registrar.messenger())
      let instance = BroadcastActivityPlugin()
      registrar.addMethodCallDelegate(instance, channel: methodChannel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        do {
            switch call.method {
            case "start":
                guard let callArguments = call.arguments as? [String: Any?] else {
                    throw MediaCaptureError.nilPointer
                }
                let pickerView = RPSystemBroadcastPickerView()
                pickerView.preferredExtension = callArguments["preferredExtension"] as? String
                pickerView.showsMicrophoneButton = true
                for view in pickerView.subviews {
                  if let button = view as? UIButton {
                    button.sendActions(for: .allEvents)
                  }
                }
            default:
              result(FlutterMethodNotImplemented)
            }
        } catch {
            result(FlutterError(code: "BroadcastActivityPluginError", message: error.localizedDescription, details: nil))
        }
    }
    
}
