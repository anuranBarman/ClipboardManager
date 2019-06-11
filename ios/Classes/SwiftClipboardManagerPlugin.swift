import Flutter
import UIKit

public class SwiftClipboardManagerPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "clipboard_manager", binaryMessenger: registrar.messenger())
    let instance = SwiftClipboardManagerPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "copyToClipBoard":
      let args = call.arguments! as! [String:Any]
      UIPasteboard.general.string = args["text"] as? String
      result(true)
      break
    case "copyFromClipBoard":
      if let clipBoardString = UIPasteboard.general.string {
        result(clipBoardString)
      }
      break
    default: 
      result("")
    }
  }
}
