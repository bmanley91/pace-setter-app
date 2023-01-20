import 'package:flutter/material.dart';
import 'package:pace_tracker_app/redux/app_state.dart';
import 'package:pace_tracker_app/util/calculators.dart';

import 'form_update_actions.dart';

AppState formUpdateReducer(AppState state, dynamic action) {
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

  if (_willUpdatePace(
      action.distance, state.timeSeconds, action.shouldCalcPace)) {
    debugPrint('Calculating pace $action');
    newState = state.copyWith(
        distanceNum: action.distance,
        paceSeconds: calculatePaceSeconds(state.timeSeconds, action.distance));
  } else if (_willUpdateTime(
      action.distance, state.paceSeconds, action.shouldCalcTime)) {
    debugPrint('Calculating time $action');
    newState = state.copyWith(
        distanceNum: action.distance,
        timeSeconds: calculateTimeSeconds(state.paceSeconds, action.distance));
  } else {
    newState = state.copyWith(distanceNum: action.distance);
  }
  debugPrint('New State $newState');
  return newState;
}

AppState handlePaceUpdate(AppState state, PaceUpdateAction action) {
  debugPrint('Handling pace update for pace ${action.pace}, $action');
  if (_willUpdateTime(state.distanceNum, action.pace, action.shouldCalcTime)) {
    return state.copyWith(
        paceSeconds: action.pace,
        timeSeconds: calculateTimeSeconds(action.pace, state.distanceNum));
  }

  return state.copyWith(paceSeconds: action.pace);
}

AppState handleTimeUpdate(AppState state, TimeUpdateAction action) {
  debugPrint('Handling time update for time ${action.time}, $action');

  if (_willUpdatePace(state.distanceNum, action.time, action.shouldCalcPace)) {
    return state.copyWith(
        timeSeconds: action.time,
        paceSeconds: calculatePaceSeconds(action.time, state.distanceNum));
  }

  return state.copyWith(timeSeconds: action.time);
}

AppState handleClearForm(AppState state) {
  debugPrint('Handling clear form action');
  return state.copyWith(distanceNum: 0, timeSeconds: 0, paceSeconds: 0);
}

bool _willUpdatePace(double distance, double time, bool shouldCalc) {
  final distanceCheck = distance > 0;
  final timeCheck = time > 0;
  debugPrint(
      'Will update pace? distanceCheck: $distanceCheck, timeCheck: $timeCheck, shouldCalc? $shouldCalc');

  return distanceCheck && timeCheck && shouldCalc;
}

bool _willUpdateTime(double distance, double pace, bool shouldCalc) {
  // final distanceCheck = isDistanceValid(distance);
  final distanceCheck = distance > 0;
  final paceCheck = pace > 0;

  debugPrint(
      'Will update time? distanceCheck: $distanceCheck, paceCheck: $paceCheck, shouldCalc? $shouldCalc');
  return distanceCheck && paceCheck && shouldCalc;
}
