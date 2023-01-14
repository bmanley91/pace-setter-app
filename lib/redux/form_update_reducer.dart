import 'package:flutter/material.dart';
import 'package:pace_tracker_app/redux/app_state.dart';
import 'package:pace_tracker_app/util/calculators.dart';

import 'form_update_actions.dart';

AppState formUpdateReducer(AppState state, dynamic action) {
  debugPrint('Form update reducer received $action');
  if (action is DistanceUpdateAction) {
    return handleDistanceUpdate(state, action);
  } else if (action is PaceUpdateAction) {
    return handlePaceUpdate(state, action);
  } else if (action is TimeUpdateAction) {
    return handleTimeUpdate(state, action);
  } else {
    return state;
  }
}

AppState handleDistanceUpdate(AppState state, DistanceUpdateAction action) {
  debugPrint(
      'Handing distance update for distance ${action.distance}, $action');
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

AppState handlePaceUpdate(AppState state, PaceUpdateAction action) {
  debugPrint('Handing pace update for pace ${action.pace}, $action');
  if (action.shouldCalcTime) {
    return state.copyWith(
        pace: action.pace, time: calculateTime(action.pace, state.distance));
  }

  return state.copyWith(pace: action.pace);
}

AppState handleTimeUpdate(AppState state, TimeUpdateAction action) {
  debugPrint('Handing time update for time ${action.time}, $action');
  if (action.shouldCalcPace) {
    final newPace = calculatePace(action.time, state.distance);
    debugPrint('Calculated new pace: $newPace');
    return state.copyWith(time: action.time, pace: newPace);
  }

  return state.copyWith(time: action.time);
}
