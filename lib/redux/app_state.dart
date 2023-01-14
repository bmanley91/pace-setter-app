import 'package:flutter/widgets.dart';

class AppState {
  final bool metricUnitsEnabled;
  final String distance;
  final String time;
  final String pace;

  AppState(
      {this.distance = '',
      this.time = '',
      this.pace = '',
      this.metricUnitsEnabled = false});

  AppState copyWith(
          {bool? metricUnitsEnabled,
          String? distance,
          String? time,
          String? pace}) =>
      AppState(
          metricUnitsEnabled: metricUnitsEnabled ?? this.metricUnitsEnabled,
          distance: distance ?? this.distance,
          time: time ?? this.time,
          pace: pace ?? this.pace);

  static AppState fromJson(dynamic json) {
    debugPrint('Loaded json: $json');
    return json != null
        ? AppState(
            metricUnitsEnabled: json["metricUnitsEnabled"] ?? false,
            distance: json["distance"] ?? '',
            time: json["time"] ?? '',
            pace: json["pace"] ?? '')
        : AppState();
  }

  dynamic toJson() => {
        'metricUnitsEnabled': metricUnitsEnabled,
        'distance': distance,
        'time': time,
        'pace': pace
      };

  @override
  String toString() {
    return toJson().toString();
  }
}
