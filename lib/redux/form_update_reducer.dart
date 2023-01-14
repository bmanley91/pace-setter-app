import 'package:flutter/material.dart';
import 'package:pace_tracker_app/redux/app_state.dart';
import 'package:pace_tracker_app/util/calculators.dart';

import 'form_update_actions.dart';

AppState formUpdateReducer(AppState state, dynamic action) {
  if (action is DistanceUpdateAction) {
    return handleDistanceUpdate(state, action);
  } else if (action is PaceUpdateAction) {
    debugPrint('Pace updated to ${action.pace}');

    // TODO: Impl
    return state;
  } else if (action is TimeUpdateAction) {
    debugPrint('Time updated to ${action.time}');

    // TODO: Impl
    return state;
  } else {
    return state;
  }
}

AppState handleDistanceUpdate(AppState state, DistanceUpdateAction action) {
  debugPrint('Distance updated to ${action.distance}');
  if (action.shouldCalcPace) {
    debugPrint('Calculating pace $action');
    return state.copyWith(
        distance: action.distance,
        pace: calculatePace(state.time, action.distance));
  } else if (action.shouldCalcTime) {
    debugPrint('Calculating time $action');
    return state.copyWith(
        distance: action.distance,
        time: calculateTime(state.pace, action.distance));
  } else {
    return state.copyWith(distance: action.distance);
  }
}
