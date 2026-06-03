// ignore_for_file: avoid_web_libraries_in_flutter, deprecated_member_use

import 'dart:js' as js;
import 'package:flutter/foundation.dart';

class AnalyticsService {
  AnalyticsService._();
  static final AnalyticsService instance = AnalyticsService._();

  /// Logs an event to GA4 via JS gtag
  void logEvent(String name, Map<String, dynamic> params) {
    if (kIsWeb) {
      try {
        if (js.context.hasProperty('gtag')) {
          js.context.callMethod('gtag', [
            'event',
            name,
            js.JsObject.jsify(params),
          ]);
          debugPrint('GA4 [Web]: logEvent($name, $params)');
        } else {
          debugPrint('GA4: gtag is not defined on window. Event $name was not logged.');
        }
      } catch (e) {
        debugPrint('GA4: Error logging event $name: $e');
      }
    } else {
      debugPrint('GA4 [Non-Web]: logEvent($name, $params)');
    }
  }

  /// Sets user properties for custom reports
  void setUserProperty(String key, String value) {
    if (kIsWeb) {
      try {
        if (js.context.hasProperty('gtag')) {
          js.context.callMethod('gtag', [
            'set',
            js.JsObject.jsify({key: value}),
          ]);
          debugPrint('GA4 [Web]: setUserProperty($key, $value)');
        } else {
          debugPrint('GA4: gtag is not defined on window. User property $key not set.');
        }
      } catch (e) {
        debugPrint('GA4: Error setting user property $key: $e');
      }
    } else {
      debugPrint('GA4 [Non-Web]: setUserProperty($key, $value)');
    }
  }
}
