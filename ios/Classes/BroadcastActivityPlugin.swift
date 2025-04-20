import Flutter
import UIKit
import ReplayKit

public class BroadcastActivityPlugin: NSObject, FlutterPlugin, RPBroadcastActivityViewControllerDelegate {
    
    public static func register(with registrar: FlutterPluginRegistrar) {
      let methodChannel = FlutterMethodChannel(
          name: "com.yullg.flutter.media_capture/broadcast_activity_method",
          binaryMessenger: registrar.messenger())
      let instance = BroadcastActivityPlugin()
      registrar.addMethodCallDelegate(instance, channel: methodChannel)
    }

    private var broadcastController: RPBroadcastController?
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        do {
            switch call.method {
            case "start":
                guard let callArguments = call.arguments as? [String: Any?] else {
                    throw MediaCaptureError.nilPointer
                }
                startScreenRecord()
//                RPBroadcastActivityViewController.load(
//                    withPreferredExtension: callArguments["withPreferredExtension"] as? String
//                ) { controller, error in
//                    if let controller {
//                        controller.delegate = self
//                        do {
//                            try Utils.rootViewController().present(controller, animated: true)
//                        } catch {
//                            result(FlutterError(code: "BroadcastActivityPluginError", message: error.localizedDescription, details: nil))
//                        }
//                    } else {
//                        result(FlutterError(code: "BroadcastActivityPluginError", message: error?.localizedDescription, details: nil))
//                    }
//                }
            default:
              result(FlutterMethodNotImplemented)
            }
        } catch {
            result(FlutterError(code: "BroadcastActivityPluginError", message: error.localizedDescription, details: nil))
        }
    }
    
    func startScreenRecord() {
        // 创建录屏按钮
        let pickerView = RPSystemBroadcastPickerView()
        // 指定只使用我们自己的 Extension
//        pickerView.preferredExtension = "com.equationl.screenRecordDemo.RecodeExtension"
        // 显示录制麦克风按钮
        pickerView.showsMicrophoneButton = true
        
        // 直接触发它的点击事件
        for view in pickerView.subviews {
          if let button = view as? UIButton {
            button.sendActions(for: .allEvents)
          }
        }
    }
    
    public func broadcastActivityViewController(
        _ broadcastActivityViewController: RPBroadcastActivityViewController,
        didFinishWith broadcastController: RPBroadcastController?,
        error: (any Error)?
    ) {
        broadcastActivityViewController.dismiss(animated: true)
        self.broadcastController = broadcastController
        broadcastController?.startBroadcast(handler: { error in
            if let error = error {
              print("Broadcast error: \(error)")
            } else {
              print("Broadcast started")
            }
        })
    }

}
