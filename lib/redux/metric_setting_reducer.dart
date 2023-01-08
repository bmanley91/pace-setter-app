import 'package:flutter/material.dart';

import 'metric_state_action.dart';

bool metricSettingReducer(bool metricState, dynamic action) {
  debugPrint('Reducer received $action');
  if (action == MetricStateActions.flip) {
    return !metricState;
  }

  return metricState;
}
