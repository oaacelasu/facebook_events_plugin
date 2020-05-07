package com.paymentez.facebookeventsplugin

import android.os.Bundle
import androidx.annotation.NonNull;

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar
import com.facebook.appevents.AppEventsLogger
import java.math.BigDecimal
import java.util.*
/** FacebookeventspluginPlugin */
public class FacebookeventspluginPlugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.getFlutterEngine().getDartExecutor(), "facebookeventsplugin")
    logger = AppEventsLogger.newLogger(flutterPluginBinding.applicationContext)

    channel.setMethodCallHandler(this);
  }

  // This static function is optional and equivalent to onAttachedToEngine. It supports the old
  // pre-Flutter-1.12 Android projects. You are encouraged to continue supporting
  // plugin registration via this function while apps migrate to use the new Android APIs
  // post-flutter-1.12 via https://flutter.dev/go/android-project-migration.
  //
  // It is encouraged to share logic between onAttachedToEngine and registerWith to keep
  // them functionally equivalent. Only one of onAttachedToEngine or registerWith will be called
  // depending on the user's project. onAttachedToEngine or registerWith must both be defined
  // in the same class.
  companion object {
    @JvmStatic
    fun registerWith(registrar: Registrar) {
      val channel = MethodChannel(registrar.messenger(), "facebookeventsplugin")
      logger = AppEventsLogger.newLogger(registrar.activeContext())

      channel.setMethodCallHandler(FacebookeventspluginPlugin())
    }

    private fun createBundleFromMap(map: Map<String, Any>?): Bundle? {
      if (map == null) {
        return null
      }
      val bundle = Bundle()
      for ((key, value) in map) {
        when (value) {
          is String -> {
            bundle.putString(key, value)
          }
          is Int -> {
            bundle.putInt(key, value)
          }
          is Long -> {
            bundle.putLong(key, value)
          }
          is Double -> {
            bundle.putDouble(key, value)
          }
          is Boolean -> {
            bundle.putBoolean(key, value)
          }
          else -> {
            throw IllegalArgumentException(
                    "Unsupported value type: " + value.javaClass.canonicalName)
          }
        }
      }
      return bundle
    }

  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    when (call.method) {
      "logEvent" -> handleLogEvent(call, result)
      "logPurchase" -> handlePurchaseEvent(call, result)
      "setUserId" -> handleSetUserId(call, result)
      "clearUserData" -> handleClearUserData(call, result)
      "addToCart" -> handleAddToCartEvent(call, result)
      "initiateCheckout" -> handleInitiateCheckoutEvent(call, result)
      else -> result.notImplemented()
    }
  }
  private fun handleLogEvent(call: MethodCall, result: MethodChannel.Result) {
    val arguments = call.arguments as Map<*, *>
    val eventName = arguments["name"] as String?
    val parameterBundle = createBundleFromMap(arguments["parameters"] as Map<String, Any>?)
    logger.logEvent(eventName, parameterBundle)
    result.success(null)
  }

  private fun handleAddToCartEvent(call: MethodCall, result: MethodChannel.Result) {
    val arguments = call.arguments as Map<*, *>
    val eventName = arguments["name"] as String?
    val price = arguments["price"] as Double
    val parameterBundle = createBundleFromMap(arguments["parameters"] as Map<String, Any>?)
    logger.logEvent(eventName, price, parameterBundle)
    result.success(null)
  }

  private fun handleInitiateCheckoutEvent(call: MethodCall, result: MethodChannel.Result) {
    val arguments = call.arguments as Map<*, *>
    val eventName = arguments["name"] as String?
    val totalPrice = arguments["totalPrice"] as Double
    val parameterBundle = createBundleFromMap(arguments["parameters"] as Map<String, Any>?)
    logger.logEvent(eventName, totalPrice, parameterBundle)
    result.success(null)
  }

  private fun handlePurchaseEvent(call: MethodCall, result: MethodChannel.Result) {
    val arguments = call.arguments as Map<*, *>
    val purchaseAmount = arguments["purchaseAmount"] as Double
    val currency = arguments["currency"] as String?
    logger.logPurchase(BigDecimal.valueOf(purchaseAmount), Currency.getInstance(currency), null)
    result.success(null)
  }

  private fun handleSetUserId(call: MethodCall, result: MethodChannel.Result) {
    val id = call.arguments as String
    AppEventsLogger.setUserID(id)
    result.success(null)
  }

  private fun handleClearUserData(call: MethodCall, result: MethodChannel.Result) {
    AppEventsLogger.clearUserData()
    result.success(null)
  }
  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
