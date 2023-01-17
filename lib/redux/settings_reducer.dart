import 'package:flutter/material.dart';

import 'app_state.dart';
import 'settings_actions.dart';

AppState settingsReducer(AppState appState, dynamic action) {
  // debugPrint('Reducer received $action');
  if (action is MetricUnitSettingUpdateAction) {
    debugPrint('Reducer received $action');
    return appState.copyWith(metricUnitsEnabled: !appState.metricUnitsEnabled);
  } else if (action is DarkModeSettingUpdateAction) {
    debugPrint('Dark mode update!');
    return appState.copyWith(darkModeEnabled: !appState.darkModeEnabled);
  }

  return appState;
}
