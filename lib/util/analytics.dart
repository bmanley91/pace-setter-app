import 'package:flutter/foundation.dart';

import 'package:firebase_analytics/firebase_analytics.dart';

class AnalyticsClient {
  AnalyticsClient._privateConstructor();

  static final AnalyticsClient instance = AnalyticsClient._privateConstructor();

  logPageLoad() async {
    const environment = kDebugMode ? 'debug' : 'production';
    debugPrint('Logging page load for environment: $environment');
    await FirebaseAnalytics.instance.logEvent(
      name: 'page-load',
      parameters: {
        'environment': kDebugMode ? 'debug' : 'production',
      },
    );
    debugPrint('Finished logging page load');
  }
}
