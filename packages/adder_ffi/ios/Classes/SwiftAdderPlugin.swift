import Flutter
import UIKit

public class SwiftAdderPlugin: NSObject, FlutterPlugin {
  // public static func register(with registrar: FlutterPluginRegistrar) {
  // }

  // public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
  //   // Noop
  //   result(nil)
  // }
    public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "add", binaryMessenger: registrar.messenger())
    let instance = SwiftAdderPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }

  public static func dummyMethodToEnforceBundling( result: @escaping FlutterResult) {
    add(40, 2)
    result(nil)
  }
}
