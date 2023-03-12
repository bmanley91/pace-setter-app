import 'package:flutter/foundation.dart';

import 'package:firebase_analytics/firebase_analytics.dart';

class AnalyticsClient {
  AnalyticsClient._privateConstructor();

  static final AnalyticsClient instance = AnalyticsClient._privateConstructor();

  logPageLoad() async => await FirebaseAnalytics.instance.logEvent(
        name: 'page-load',
        parameters: {
          'environment': kDebugMode ? 'debug' : 'production',
        },
      );
}
