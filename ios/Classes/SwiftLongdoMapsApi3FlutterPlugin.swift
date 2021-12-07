import Flutter
import UIKit

public class SwiftLongdoMapsApi3FlutterPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "longdo_maps_api3_flutter", binaryMessenger: registrar.messenger())
    let instance = SwiftLongdoMapsApi3FlutterPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }
}
