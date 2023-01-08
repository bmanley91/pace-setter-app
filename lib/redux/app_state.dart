class AppState {
  final bool metricUnitsEnabled;

  AppState({this.metricUnitsEnabled = false});

  AppState copyWith({bool? metricUnitsEnabled}) => AppState(
      metricUnitsEnabled: metricUnitsEnabled ?? this.metricUnitsEnabled);

  static AppState fromJson(dynamic json) =>
      AppState(metricUnitsEnabled: json['metricUnitsEnabled']);

  dynamic toJson() => {'metricUnitsEnabled': metricUnitsEnabled};
}
