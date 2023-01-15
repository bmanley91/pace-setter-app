import 'package:flutter/material.dart';
import 'package:pace_tracker_app/redux/app_state.dart';
import 'package:pace_tracker_app/util/calculators.dart';
import 'package:pace_tracker_app/util/converters.dart';

import '../util/validators.dart';
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
  final distanceNum = double.parse(action.distance);

  if (_willUpdatePace(action.distance, state.time, action.shouldCalcPace)) {
    debugPrint('Calculating pace $action');
    newState = state.copyWith(
        distance: action.distance,
        distanceNum: distanceNum,
        pace: calculatePace(state.time, action.distance),
        paceSeconds: calculatePaceSeconds(state.timeSeconds, distanceNum));
  } else if (_willUpdateTime(
      action.distance, state.pace, action.shouldCalcTime)) {
    debugPrint('Calculating time $action');
    newState = state.copyWith(
        distance: action.distance,
        distanceNum: distanceNum,
        time: calculateTime(state.pace, action.distance),
        timeSeconds: calculateTimeSeconds(state.paceSeconds, distanceNum));
  } else {
    newState =
        state.copyWith(distance: action.distance, distanceNum: distanceNum);
  }
  debugPrint('New State $newState');
  return newState;
}

AppState handlePaceUpdate(AppState state, PaceUpdateAction action) {
  debugPrint('Handling pace update for pace ${action.pace}, $action');
  final paceSeconds = timeStringToSeconds(action.pace);
  if (_willUpdateTime(state.distance, action.pace, action.shouldCalcTime)) {
    return state.copyWith(
        pace: action.pace,
        paceSeconds: paceSeconds,
        time: calculateTime(action.pace, state.distance),
        timeSeconds:
            calculateTimeSeconds(paceSeconds, double.parse(state.distance)));
  }

  return state.copyWith(pace: action.pace, paceSeconds: paceSeconds);
}

AppState handleTimeUpdate(AppState state, TimeUpdateAction action) {
  debugPrint('Handling time update for time ${action.time}, $action');
  final timeSeconds = timeStringToSeconds(action.time);
  if (_willUpdatePace(state.distance, action.time, action.shouldCalcPace)) {
    final newPace = calculatePace(action.time, state.distance);
    debugPrint('Calculated new pace: $newPace');
    return state.copyWith(
        time: action.time,
        timeSeconds: timeSeconds,
        pace: newPace,
        paceSeconds:
            calculatePaceSeconds(timeSeconds, double.parse(state.distance)));
  }

  return state.copyWith(time: action.time, timeSeconds: timeSeconds);
}

AppState handleClearForm(AppState state) {
  debugPrint('Handling clear form action');
  return state.copyWith(
      distance: '',
      distanceNum: 0,
      time: '',
      timeSeconds: 0,
      pace: '',
      paceSeconds: 0);
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
