import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Facebookeventsplugin {
  static const String EVENT_NAME_FIRST_OPEN = 'custom_first_open';
  static const String EVENT_NAME_FIRST_LOGIN = 'custom_first_login';
  static const String EVENT_NAME_CART_CLEARED = 'custom_cart_cleared';
  static const String EVENT_NAME_PURCHASE_STARTED = 'custom_start_purchased';
  static const String EVENT_NAME_VENUE_SELECTED = 'custom_select_store';
  static const String EVENT_NAME_PURCHASE = 'custom_purchase';
  static const String EVENT_NAME_PURCHASE_V2 = 'custom_purchase_v2';
  static const String EVENT_NAME_ADDED_TO_CART_V2 = "fb_mobile_add_to_cart_v2";
  static const String EVENT_NAME_FIRST_OPEN_DATAGRAND = 'first_open';
  static const String EVENT_NAME_FIRST_LOGIN_DATAGRAND = 'first_login';
  static const String EVENT_NAME_VENUE_SELECTED_DATAGRAND = 'store_selection';
  static const String EVENT_NAME_PURCHASE_STARTED_DATAGRAND = 'purchase_start';
  static const String EVENT_NAME_ADDED_TO_CART_DATAGRAND = "product_added";
  static const String EVENT_NAME_BEGIN_CHECKOUT_DATAGRAND = 'begin_checkout';
  static const String EVENT_NAME_CART_CLEARED_DATAGRAND = 'cart_cleared';
  static const String EVENT_NAME_PURCHASE_DATAGRAND = 'purchase';

  /// Log this event when an app is being activated. */
  static const String EVENT_NAME_ACTIVATED_APP = "fb_mobile_activate_app";

  static const String EVENT_NAME_DEACTIVATED_APP = "fb_mobile_deactivate_app";

  static const String EVENT_NAME_SESSION_INTERRUPTIONS =
      "fb_mobile_app_interruptions";

  static const String EVENT_NAME_TIME_BETWEEN_SESSIONS =
      "fb_mobile_time_between_sessions";

  /// Log this event when the user has completed registration with the app. */
  static const String EVENT_NAME_COMPLETED_REGISTRATION =
      "fb_mobile_complete_registration";

  /// Log this event when the user has viewed a form of content in the app. */
  static const String EVENT_NAME_VIEWED_CONTENT = "fb_mobile_content_view";

  /// Log this event when the user has performed a search within the app. */
  static const String EVENT_NAME_SEARCHED = "fb_mobile_search";

  /// Log this event when the user has rated an item in the app.
  /// The valueToSum passed to logEvent should be the numeric rating.
  static const String EVENT_NAME_RATED = "fb_mobile_rate";

  /// Log this event when the user has completed a tutorial in the app. */
  static const String EVENT_NAME_COMPLETED_TUTORIAL =
      "fb_mobile_tutorial_completion";

  /// Log this event when the app obtained a push registration token from FCM. */
  static const String EVENT_NAME_PUSH_TOKEN_OBTAINED =
      "fb_mobile_obtain_push_token";

  // Ecommerce related

  /// Log this event when the user has added an item to their cart.
  /// The valueToSum passed to logEvent should be the item's price.
  static const String EVENT_NAME_ADDED_TO_CART = "fb_mobile_add_to_cart";

  /// Log this event when the user has added an item to their wishlist.
  /// The valueToSum passed to logEvent should be the item's price.
  static const String EVENT_NAME_ADDED_TO_WISHLIST =
      "fb_mobile_add_to_wishlist";

  /// Log this event when the user has entered the checkout process.
  /// The valueToSum passed to logEvent should be the total price in the cart.
  static const String EVENT_NAME_INITIATED_CHECKOUT =
      "fb_mobile_initiated_checkout";

  /// Log this event when the user has entered their payment info. */
  static const String EVENT_NAME_ADDED_PAYMENT_INFO =
      "fb_mobile_add_payment_info";

  ///  @deprecated Use {@link
  ///  AppEventsLogger#logPurchase(java.math.BigDecimal, java.util.Currency)} instead.
  ///  Log this event when the user has completed a purchase. The {@link
  ///  AppEventsLogger#logPurchase(java.math.BigDecimal, java.util.Currency)} method is a shortcut
  ///  for logging this event.

//  @Deprecated
//  static const String EVENT_NAME_PURCHASED = "fb_mobile_purchase";

  // Gaming related

  // ignore: slash_for_doc_comments
  /** Log this event when the user has achieved a level in the app. */
  static const String EVENT_NAME_ACHIEVED_LEVEL = "fb_mobile_level_achieved";

  // ignore: slash_for_doc_comments
  /** Log this event when the user has unlocked an achievement in the app. */
  static const String EVENT_NAME_UNLOCKED_ACHIEVEMENT =
      "fb_mobile_achievement_unlocked";

  // ignore: slash_for_doc_comments
  /**
   * Log this event when the user has spent app credits.
   * The valueToSum passed to logEvent should be the number of credits spent.
   */
  static const String EVENT_NAME_SPENT_CREDITS = "fb_mobile_spent_credits";

  // ignore: slash_for_doc_comments
  /**
   * A telephone/SMS, email, chat or other type of contact between a customer and your business.
   */
  static const String EVENT_NAME_CONTACT = "Contact";

  // ignore: slash_for_doc_comments
  /**
   * The customization of products through a configuration tool or other application your
   * business owns.
   */
  static const String EVENT_NAME_CUSTOMIZE_PRODUCT = "CustomizeProduct";

  /// The donation of funds to your organization or cause.
  static const String EVENT_NAME_NONATE = "Donate";

  // ignore: slash_for_doc_comments
  /**
   * When a person finds one of your locations via web or application, with an intention to visit
   * (example: find product at a local store).
   */
  static const String EVENT_NAME_FIND_LOCATION = "FindLocation";

  /// The booking of an appointment to visit one of your locations.
  static const String EVENT_NAME_SCHEDULE = "Schedule";

  /// The start of a free trial of a product or service you offer (example: trial subscription).
  static const String EVENT_NAME_START_TRIAL = "StartTrial";

  /// The submission of an application for a product, service or program you offer
  /// (example: credit card, educational program or job).
  static const String EVENT_NAME_SUBMIT_APPLICATION = "SubmitApplication";

  /// The start of a paid subscription for a product or service you offer.
  static const String EVENT_NAME_SUBSCRIBE = "Subscribe";

  /// Log this event when the user views an ad.
  static const String EVENT_NAME_AD_IMPRESSION = "AdImpression";

  /// Log this event when the user clicks an ad.
  static const String EVENT_NAME_AD_CLICK = "AdClick";

  /// Log the live streaming events from sdk
  static const String EVENT_NAME_LIVE_STREAMING_START =
      "fb_sdk_live_streaming_start";
  static const String EVENT_NAME_LIVE_STREAMING_STOP =
      "fb_sdk_live_streaming_stop";
  static const String EVENT_NAME_LIVE_STREAMING_PAUSE =
      "fb_sdk_live_streaming_pause";
  static const String EVENT_NAME_LIVE_STREAMING_RESUME =
      "fb_sdk_live_streaming_resume";
  static const String EVENT_NAME_LIVE_STREAMING_ERROR =
      "fb_sdk_live_streaming_error";
  static const String EVENT_NAME_LIVE_STREAMING_UPDATE_STATUS =
      "fb_sdk_live_streaming_update_status";

  /// Product Catalog related events
  static const String EVENT_NAME_PRODUCT_CATALOG_UPDATE =
      "fb_mobile_catalog_update";

  // Event parameters

  /// Paramete keys for live streaming events
  ///
  static const String EVENT_PARAM_LIVE_STREAMING_PREV_STATUS =
      "live_streaming_prev_status";
  static const String EVENT_PARAM_LIVE_STREAMING_STATUS =
      "live_streaming_status";
  static const String EVENT_PARAM_LIVE_STREAMING_ERROR = "live_streaming_error";

  /// Parameter key used to specify currency used with logged event.  E.g. "USD", "EUR", "GBP". See
  /// <a href="http://en.wikipedia.org/wiki/ISO_4217">ISO-4217</a>
  /// for specific values.
  static const String EVENT_PARAM_CURRENCY = "fb_currency";

  /// Parameter key used to specify the method the user has used to register for the app, e.g.,
  /// "Facebook", "email", "Twitter", etc.
  static const String EVENT_PARAM_REGISTRATION_METHOD =
      "fb_registration_method";

  /// Parameter key used to specify a generic content type/family for the logged event, e.g.
  /// "music", "photo", "video".  Options to use will vary depending on the nature of the app.
  static const String EVENT_PARAM_CONTENT_TYPE = "fb_content_type";

  /// Parameter key used to specify data for the one or more pieces of content being logged about.
  /// Data should be a JSON encoded string.
  /// Example:
  /// "[{\"id\": \"1234\", \"quantity\": 2, \"item_price\": 5.99}, {\"id\": \"5678\", \"quantity\": 1, \"item_price\": 9.99}]"
  static const String EVENT_PARAM_CONTENT = "fb_content";

  /// Parameter key used to specify an ID for the specific piece of content being logged about.
  /// This could be an EAN, article identifier, etc., depending on the nature of the app.
  static const String EVENT_PARAM_CONTENT_ID = "fb_content_id";

  /// Parameter key used to specify the string provided by the user for a search operation. */
  static const String EVENT_PARAM_SEARCH_STRING = "fb_search_string";

  /// Parameter key used to specify whether the activity being logged about was successful or not.
  /// EVENT_PARAM_VALUE_YES and EVENT_PARAM_VALUE_NO are good canonical values to use for this
  /// parameter.
  static const String EVENT_PARAM_SUCCESS = "fb_success";

  /// Parameter key used to specify the maximum rating available for the EVENT_NAME_RATE event.
  /// E.g., "5" or "10".
  static const String EVENT_PARAM_MAX_RATING_VALUE = "fb_max_rating_value";

  /// Parameter key used to specify whether payment info is available for the
  /// EVENT_NAME_INITIATED_CHECKOUT event. EVENT_PARAM_VALUE_YES and EVENT_PARAM_VALUE_NO are good
  /// canonical values to use for this parameter.
  static const String EVENT_PARAM_PAYMENT_INFO_AVAILABLE =
      "fb_payment_info_available";

  /// Parameter key used to specify how many items are being processed for an
  /// EVENT_NAME_INITIATED_CHECKOUT or EVENT_NAME_PURCHASE event.
  static const String EVENT_PARAM_NUM_ITEMS = "fb_num_items";

  /// Parameter key used to specify the level achieved in an EVENT_NAME_LEVEL_ACHIEVED event. */
  static const String EVENT_PARAM_LEVEL = "fb_level";

  /// Parameter key used to specify a description appropriate to the event being logged.
  /// E.g., the name of the achievement unlocked in the EVENT_NAME_ACHIEVEMENT_UNLOCKED event.
  static const String EVENT_PARAM_DESCRIPTION = "fb_description";

  /// Parameter key used to specify source application package.
  static const String EVENT_PARAM_SOURCE_APPLICATION =
      "fb_mobile_launch_source";

  // Parameter values

  /// Yes-valued parameter value to be used with parameter keys that need a Yes/No value */
  static const String EVENT_PARAM_VALUE_YES = "1";

  /// No-valued parameter value to be used with parameter keys that need a Yes/No value */
  static const String EVENT_PARAM_VALUE_NO = "0";

  /// Parameter key used to specify the type of ad in an EVENT_NAME_AD_IMPRESSION
  /// or EVENT_NAME_AD_CLICK event.
  /// E.g. "banner", "interstitial", "rewarded_video", "native"
  static const String EVENT_PARAM_AD_TYPE = "ad_type";

  /// Parameter key used to specify the unique ID for all events within a subscription
  /// in an EVENT_NAME_SUBSCRIBE or EVENT_NAME_START_TRIAL event.
  static const String EVENT_PARAM_ORDER_ID = "fb_order_id";

  static const String EVENT_PARAM_VALUE_TO_SUM = "_valueToSum";

  /// Parameter keys used to specify additional information about item for
  /// EVENT_NAME_PRODUCT_CATALOG_UPDATE event.
  static const String EVENT_PARAM_PRODUCT_CUSTOM_LABEL_0 =
      "fb_product_custom_label_0";
  static const String EVENT_PARAM_PRODUCT_CUSTOM_LABEL_1 =
      "fb_product_custom_label_1";
  static const String EVENT_PARAM_PRODUCT_CUSTOM_LABEL_2 =
      "fb_product_custom_label_2";
  static const String EVENT_PARAM_PRODUCT_CUSTOM_LABEL_3 =
      "fb_product_custom_label_3";
  static const String EVENT_PARAM_PRODUCT_CUSTOM_LABEL_4 =
      "fb_product_custom_label_4";

  // Optional field "google_product_category"
  static const String EVENT_PARAM_PRODUCT_CATEGORY = "fb_product_category";

  /// Parameter keys used to specify the product deep links for
  /// EVENT_NAME_PRODUCT_CATALOG_UPDATE event.
  static const String EVENT_PARAM_PRODUCT_APPLINK_IOS_URL =
      "fb_product_applink_ios_url";
  static const String EVENT_PARAM_PRODUCT_APPLINK_IOS_APP_STORE_ID =
      "fb_product_applink_ios_app_store_id";
  static const String EVENT_PARAM_PRODUCT_APPLINK_IOS_APP_NAME =
      "fb_product_applink_ios_app_name";
  static const String EVENT_PARAM_PRODUCT_APPLINK_IPHONE_URL =
      "fb_product_applink_iphone_url";
  static const String EVENT_PARAM_PRODUCT_APPLINK_IPHONE_APP_STORE_ID =
      "fb_product_applink_iphone_app_store_id";
  static const String EVENT_PARAM_PRODUCT_APPLINK_IPHONE_APP_NAME =
      "fb_product_applink_iphone_app_name";
  static const String EVENT_PARAM_PRODUCT_APPLINK_IPAD_URL =
      "fb_product_applink_ipad_url";
  static const String EVENT_PARAM_PRODUCT_APPLINK_IPAD_APP_STORE_ID =
      "fb_product_applink_ipad_app_store_id";
  static const String EVENT_PARAM_PRODUCT_APPLINK_IPAD_APP_NAME =
      "fb_product_applink_ipad_app_name";
  static const String EVENT_PARAM_PRODUCT_APPLINK_ANDROID_URL =
      "fb_product_applink_android_url";
  static const String EVENT_PARAM_PRODUCT_APPLINK_ANDROID_PACKAGE =
      "fb_product_applink_android_package";
  static const String EVENT_PARAM_PRODUCT_APPLINK_ANDROID_APP_NAME =
      "fb_product_applink_android_app_name";
  static const String EVENT_PARAM_PRODUCT_APPLINK_WINDOWS_PHONE_URL =
      "fb_product_applink_windows_phone_url";
  static const String EVENT_PARAM_PRODUCT_APPLINK_WINDOWS_PHONE_APP_ID =
      "fb_product_applink_windows_phone_app_id";
  static const String EVENT_PARAM_PRODUCT_APPLINK_WINDOWS_PHONE_APP_NAME =
      "fb_product_applink_windows_phone_app_name";

  factory Facebookeventsplugin() => _instance;

  Facebookeventsplugin.private(MethodChannel platformChannel)
      : _channel = platformChannel;

  final MethodChannel _channel;

  static final Facebookeventsplugin _instance =
      Facebookeventsplugin.private(const MethodChannel('facebookeventsplugin'));

  Future<void> logEvent(
      {@required String name, Map<String, dynamic> parameters}) async {
    await _channel.invokeMethod('logEvent', <String, dynamic>{
      'name': name,
      'parameters': parameters,
    });
  }

  Future<void> addToCart(
      {@required String name,
      @required double price,
      @required Map<String, dynamic> parameters}) async {
    await _channel.invokeMethod('addToCart', <String, dynamic>{
      'name': name,
      'price': price,
      'parameters': parameters,
    });
  }

  Future<void> initiateCheckout(
      {@required String name,
      @required double totalPrice,
      @required Map<String, dynamic> parameters}) async {
    await _channel.invokeMethod('initiateCheckout', <String, dynamic>{
      'name': name,
      'totalPrice': totalPrice,
      'parameters': parameters,
    });
  }

  Future<void> setUserId(String id) async {
    await _channel.invokeMethod('setUserId', id);
  }

  Future<void> logPurchase(double purchaseAmount, String currency) async {
    await _channel.invokeMethod('logPurchase', <String, dynamic>{
      'purchaseAmount': purchaseAmount,
      'currency': currency
    });
  }

  Future<void> clearUserData() async {
    await _channel.invokeMethod('clearUserData');
  }
}
