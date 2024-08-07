import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  private let CHANNEL = "samples.flutter.dev/"

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
    let connectivityChannel = FlutterMethodChannel(name: CHANNEL,
                                                   binaryMessenger: controller.binaryMessenger)
    connectivityChannel.setMethodCallHandler {
      [weak self] (call: FlutterMethodCall, result: @escaping FlutterResult) in
      if call.method == "checkConnectivity" {
        let reachability = Reachability() // You'll need to implement Reachability or use a library.
        result(reachability.connection != .none)
      } else {
        result(FlutterMethodNotImplemented)
      }
    }

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
