import 'package:flutter/widgets.dart';

class AppState {
  final bool metricUnitsEnabled;
  final bool darkModeEnabled;
  final double distanceNum;
  final double timeSeconds;
  final double paceSeconds;

  AppState(
      {this.distanceNum = 0,
      this.timeSeconds = 0,
      this.paceSeconds = 0,
      this.metricUnitsEnabled = false,
      this.darkModeEnabled = false});

  AppState copyWith(
          {bool? metricUnitsEnabled,
          double? distanceNum,
          double? timeSeconds,
          double? paceSeconds,
          bool? darkModeEnabled}) =>
      AppState(
        metricUnitsEnabled: metricUnitsEnabled ?? this.metricUnitsEnabled,
        distanceNum: distanceNum ?? this.distanceNum,
        timeSeconds: timeSeconds ?? this.timeSeconds,
        paceSeconds: paceSeconds ?? this.paceSeconds,
        darkModeEnabled: darkModeEnabled ?? this.darkModeEnabled,
      );

  static AppState fromJson(dynamic json) {
    debugPrint('Loaded json: $json');
    return json != null
        ? AppState(
            metricUnitsEnabled: json['metricUnitsEnabled'] ?? false,
            distanceNum: json['distanceNum'] ?? 0,
            timeSeconds: json['timeSeconds'] ?? 0,
            paceSeconds: json['paceSeconds'] ?? 0,
            darkModeEnabled: json['darkModeEnabled'] ?? false)
        : AppState();
  }

  dynamic toJson() => {
        'metricUnitsEnabled': metricUnitsEnabled,
        'distanceNum': distanceNum,
        'timeSeconds': timeSeconds,
        'paceSeconds': paceSeconds,
        'darkModeEnabled': darkModeEnabled
      };

  @override
  String toString() {
    return toJson().toString();
  }
}
