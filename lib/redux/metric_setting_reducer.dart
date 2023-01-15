import 'package:flutter/material.dart';

import 'app_state.dart';
import 'metric_state_action.dart';

AppState metricSettingReducer(AppState appState, dynamic action) {
  // debugPrint('Reducer received $action');
  if (action == MetricStateActions.flip) {
    debugPrint('Reducer received $action');
    return appState.copyWith(metricUnitsEnabled: !appState.metricUnitsEnabled);
  }

  return appState;
}
