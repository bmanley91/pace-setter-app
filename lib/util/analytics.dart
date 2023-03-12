import 'package:flutter/foundation.dart';

import 'package:firebase_analytics/firebase_analytics.dart';

class AnalyticsClient {
  AnalyticsClient._privateConstructor();

  static final AnalyticsClient instance = AnalyticsClient._privateConstructor();
  final environment = kDebugMode ? 'debug' : 'production';

  logPageLoad() => _logEvent('page-loaded');

  logDistanceUpdated() => _logEvent('distance-updated');
  logPaceUpdated() => _logEvent('pace-updated');
  logTimeUpdated() => _logEvent('time-updated');

  logSettingsOpened() => _logEvent('settings-opened');

  _logEvent(String eventName) => FirebaseAnalytics.instance.logEvent(
        name: eventName,
        parameters: {
          'environment': environment,
        },
      );
}
