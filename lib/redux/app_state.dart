import 'package:flutter/widgets.dart';

class AppState {
  final bool metricUnitsEnabled;

  AppState({this.metricUnitsEnabled = false});

  AppState copyWith({bool? metricUnitsEnabled}) => AppState(
      metricUnitsEnabled: metricUnitsEnabled ?? this.metricUnitsEnabled);

  static AppState fromJson(dynamic json) {
    debugPrint('Loaded json: $json');
    return json != null
        ? AppState(metricUnitsEnabled: json["metricUnitsEnabled"])
        : AppState();
  }

  dynamic toJson() => {'metricUnitsEnabled': metricUnitsEnabled};
}
