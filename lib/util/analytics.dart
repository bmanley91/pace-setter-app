import 'package:flutter/foundation.dart';

import 'package:firebase_analytics/firebase_analytics.dart';

class AnalyticsClient {
  AnalyticsClient._privateConstructor();

  static final AnalyticsClient instance = AnalyticsClient._privateConstructor();
  final environment = kDebugMode ? 'debug' : 'production';

  logPageLoad() => _logEvent('page_loaded');

  logDistanceUpdated() => _logEvent('distance_updated');
  logPaceUpdated() => _logEvent('pace_updated');
  logTimeUpdated() => _logEvent('time_updated');

  logSettingsOpened() => _logEvent('settings_opened');

  _logEvent(String eventName) => FirebaseAnalytics.instance.logEvent(
        name: eventName,
        parameters: {
          'environment': environment,
        },
      );
}
