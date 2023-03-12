import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:pace_tracker_app/redux/app_state.dart';
import 'package:pace_tracker_app/util/analytics.dart';
import 'package:redux/redux.dart';

import 'pace_checker_app.dart';

class AppWrapper extends StatelessWidget {
  final Store<AppState> appStore;
  final AnalyticsClient analyticsClient;

  const AppWrapper({
    super.key,
    required this.appStore,
    required this.analyticsClient,
  });

  @override
  Widget build(BuildContext context) {
    analyticsClient.logPageLoad();
    return StoreProvider<AppState>(
      store: appStore,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: const PaceCheckerApp(),
      ),
    );
  }
}
