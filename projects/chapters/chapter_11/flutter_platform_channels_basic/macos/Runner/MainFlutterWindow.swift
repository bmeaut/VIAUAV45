import Cocoa
import FlutterMacOS
import IOKit.ps

class MainFlutterWindow: NSWindow {
  override func awakeFromNib() {
    let flutterViewController = FlutterViewController()
    let windowFrame = self.frame
    self.contentViewController = flutterViewController
    self.setFrame(windowFrame, display: true)

      
      let batteryChannel = FlutterMethodChannel(
        name: "hu.bme.aut.flutter/data",
        binaryMessenger: flutterViewController.engine.binaryMessenger)
      batteryChannel.setMethodCallHandler { (call, result) in
        switch call.method {
        case "getPlatformSpecificData":
          guard let level = getBatteryLevel() else {
            result(
              FlutterError(
                code: "UNAVAILABLE",
                message: "Battery level not available",
                details: nil))
           return
          }
          result(level)
        default:
          result(FlutterMethodNotImplemented)
        }
      }
      
    RegisterGeneratedPlugins(registry: flutterViewController)

    super.awakeFromNib()
  }
}

private func getBatteryLevel() -> Int? {
  let info = IOPSCopyPowerSourcesInfo().takeRetainedValue()
  let sources: Array<CFTypeRef> = IOPSCopyPowerSourcesList(info).takeRetainedValue() as Array
  if let source = sources.first {
    let description =
      IOPSGetPowerSourceDescription(info, source).takeUnretainedValue() as! [String: AnyObject]
    if let level = description[kIOPSCurrentCapacityKey] as? Int {
      return level
    }
  }
  return nil
}
