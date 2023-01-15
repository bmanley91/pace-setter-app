import 'package:flutter/widgets.dart';

class AppState {
  final bool metricUnitsEnabled;
  final double distanceNum;
  final String time;
  final double timeSeconds;
  final String pace;
  final double paceSeconds;

  AppState(
      {this.distanceNum = 0,
      this.time = '',
      this.pace = '',
      this.timeSeconds = 0,
      this.paceSeconds = 0,
      this.metricUnitsEnabled = false});

  AppState copyWith(
          {bool? metricUnitsEnabled,
          double? distanceNum,
          String? time,
          double? timeSeconds,
          String? pace,
          double? paceSeconds}) =>
      AppState(
          metricUnitsEnabled: metricUnitsEnabled ?? this.metricUnitsEnabled,
          distanceNum: distanceNum ?? this.distanceNum,
          time: time ?? this.time,
          timeSeconds: timeSeconds ?? this.timeSeconds,
          pace: pace ?? this.pace,
          paceSeconds: paceSeconds ?? this.paceSeconds);

  static AppState fromJson(dynamic json) {
    debugPrint('Loaded json: $json');
    return json != null
        ? AppState(
            metricUnitsEnabled: json['metricUnitsEnabled'] ?? false,
            distanceNum: json['distanceNum'] ?? 0,
            time: json['time'] ?? '',
            timeSeconds: json['timeSeconds'] ?? 0,
            pace: json['pace'] ?? '',
            paceSeconds: json['paceSeconds'] ?? 0)
        : AppState();
  }

  dynamic toJson() => {
        'metricUnitsEnabled': metricUnitsEnabled,
        'time': time,
        'timeSeconds': timeSeconds,
        'pace': pace,
        'paceSeconds': paceSeconds
      };

  @override
  String toString() {
    return toJson().toString();
  }
}
