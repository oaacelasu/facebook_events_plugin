import Flutter
import UIKit
import FacebookCore
import FBSDKCoreKit

public class SwiftFacebookeventspluginPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "facebookeventsplugin", binaryMessenger: registrar.messenger())
    let instance = SwiftFacebookeventspluginPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }




  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
            switch call.method {
            case "logEvent":
                handleLogEvent(call: call, result: result)
                result(nil)
            case "logPurchase":
                handlePurchaseEvent(call: call, result: result)
                result(nil)
            case "setUserId":
                handleSetUserId(call: call, result: result)
                result(nil)
            case "clearUserData":
                handleClearUserData(call: call, result: result)
                result(nil)
            case "addToCart":
                handleAddToCartEvent(call: call, result: result)
                result(nil)
            case "initiateCheckout":
                handleInitiateCheckoutEvent(call: call, result: result)
                result(nil)
            default:
                result(FlutterMethodNotImplemented)
            }
  }

      private func handleLogEvent(call: FlutterMethodCall, result: FlutterResult) {
            let arguments: Dictionary<String, Any> = call.arguments as! Dictionary
            let eventName: String = arguments["name"] as! String

            var params: Dictionary<String, Any> = [:]

            params = arguments["parameters"] as! Dictionary


            AppEvents.logEvent(AppEvents.Name.init(rawValue: eventName), parameters: params)

        }

        private func handlePurchaseEvent(call: FlutterMethodCall, result: FlutterResult) {
            let arguments: Dictionary<String, Any> = call.arguments as! Dictionary
            let purchaseAmount: Double = arguments["purchaseAmount"] as! Double
            let currency: String = arguments["currency"] as! String

            AppEvents.logPurchase(purchaseAmount, currency:currency)
        }

        private func handleSetUserId(call: FlutterMethodCall, result: FlutterResult) {
            let userId: String = call.arguments as! String

            print(userId)
        }

        private func handleClearUserData(call: FlutterMethodCall, result: FlutterResult) {
            AppEvents.clearUserData()

        }

        private func handleAddToCartEvent(call: FlutterMethodCall, result: FlutterResult) {
            let arguments: Dictionary<String, Any> = call.arguments as! Dictionary
            let price: Double = arguments["price"] as! Double

            var params: Dictionary<String, Any> = [:]

            params = arguments["parameters"] as! Dictionary

            AppEvents.logEvent(AppEvents.Name.addedToCart, valueToSum: price, parameters: params)

        }

        private func handleInitiateCheckoutEvent(call: FlutterMethodCall, result: FlutterResult) {
            let arguments: Dictionary<String, Any> = call.arguments as! Dictionary
            let totalPrice: Double = arguments["totalPrice"] as! Double

            var params: Dictionary<String, Any> = [:]

            params = arguments["parameters"] as! Dictionary

            AppEvents.logEvent(AppEvents.Name.initiatedCheckout, valueToSum:totalPrice,
                parameters:params)
        }

}
