import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
        let channel = FlutterMethodChannel(name: "hu.bme.aut.flutter/data",
                                                  binaryMessenger: controller.binaryMessenger)
        channel.setMethodCallHandler({
          [weak self] (call: FlutterMethodCall, result: FlutterResult) -> Void in
          // Note: this method is invoked on the UI thread.
          guard call.method == "getPlatformSpecificData" else {
            result(FlutterMethodNotImplemented)
            return
          }
          self?.getPlatformSpecificData(result: result)
        })

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  private func getPlatformSpecificData(result: FlutterResult) {
      result("30")
    }

}
