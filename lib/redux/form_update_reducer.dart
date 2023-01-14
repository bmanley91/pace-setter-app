import 'package:flutter/material.dart';
import 'package:pace_tracker_app/redux/app_state.dart';
import 'package:pace_tracker_app/util/calculators.dart';

import '../util/validators.dart';
import 'form_update_actions.dart';

AppState formUpdateReducer(AppState state, dynamic action) {
  // debugPrint('Form update reducer received $action');
  if (action is DistanceUpdateAction) {
    return handleDistanceUpdate(state, action);
  } else if (action is PaceUpdateAction) {
    return handlePaceUpdate(state, action);
  } else if (action is TimeUpdateAction) {
    return handleTimeUpdate(state, action);
  } else if (action is FormClearAction) {
    return handleClearForm(state);
  } else {
    return state;
  }
}

AppState handleDistanceUpdate(AppState state, DistanceUpdateAction action) {
  debugPrint(
      'Handling distance update for distance ${action.distance}, $action');
  late AppState newState;
  if (_willUpdatePace(action.distance, state.time, action.shouldCalcPace)) {
    debugPrint('Calculating pace $action');
    newState = state.copyWith(
        distance: action.distance,
        pace: calculatePace(state.time, action.distance));
  } else if (_willUpdateTime(
      action.distance, state.pace, action.shouldCalcTime)) {
    debugPrint('Calculating time $action');
    newState = state.copyWith(
        distance: action.distance,
        time: calculateTime(state.pace, action.distance));
  } else {
    newState = state.copyWith(distance: action.distance);
  }
  debugPrint('New State $newState');
  return newState;
}

AppState handlePaceUpdate(AppState state, PaceUpdateAction action) {
  debugPrint('Handling pace update for pace ${action.pace}, $action');
  if (_willUpdateTime(state.distance, action.pace, action.shouldCalcTime)) {
    return state.copyWith(
        pace: action.pace, time: calculateTime(action.pace, state.distance));
  }

  return state.copyWith(pace: action.pace);
}

AppState handleTimeUpdate(AppState state, TimeUpdateAction action) {
  debugPrint('Handling time update for time ${action.time}, $action');
  if (_willUpdatePace(state.distance, action.time, action.shouldCalcPace)) {
    final newPace = calculatePace(action.time, state.distance);
    debugPrint('Calculated new pace: $newPace');
    return state.copyWith(time: action.time, pace: newPace);
  }

  return state.copyWith(time: action.time);
}

AppState handleClearForm(AppState state) {
  debugPrint('Handling clear form action');
  return state.copyWith(distance: '', time: '', pace: '');
}

bool _willUpdatePace(String distance, String time, bool shouldCalc) {
  final distanceCheck = isDistanceValid(distance);
  final timeCheck = isTimeValid(time);
  debugPrint(
      'Will update pace? distanceCheck: $distanceCheck, timeCheck: $timeCheck, shouldCalc? $shouldCalc');

  return distanceCheck && timeCheck && shouldCalc;
}

bool _willUpdateTime(String distance, String pace, bool shouldCalc) {
  final distanceCheck = isDistanceValid(distance);
  final paceCheck = isPaceValid(pace);

  debugPrint(
      'Will update time? distanceCheck: $distanceCheck, paceCheck: $paceCheck, shouldCalc? $shouldCalc');
  return distanceCheck && paceCheck && shouldCalc;
}
