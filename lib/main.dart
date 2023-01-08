import 'package:flutter/material.dart';
import 'package:pace_tracker_app/redux/metric_setting_store.dart';
import 'package:pace_tracker_app/widgets/pace_checker_app.dart';

void main() {
  runApp(PaceCheckerApp(
    metricSettingStore: metricSettingStore,
  ));
}
