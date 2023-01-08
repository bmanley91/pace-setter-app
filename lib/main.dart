import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pace_tracker_app/redux/app_state.dart';
import 'package:pace_tracker_app/redux/metric_setting_reducer.dart';
import 'package:pace_tracker_app/widgets/pace_checker_app.dart';
import 'package:redux/redux.dart';
import 'package:redux_persist/redux_persist.dart';

void main() async {
  final persistor = Persistor<AppState>(
    storage: FileStorage(File('state.json')), // Or use other engines
    serializer:
        JsonSerializer<AppState>(AppState.fromJson), // Or use other serializers
  );

  final initialState = await persistor.load();

  final store = Store<AppState>(
    metricSettingReducer,
    initialState: initialState ?? AppState(),
    middleware: [persistor.createMiddleware()],
  );

  runApp(PaceCheckerApp(
    appStore: store,
  ));
}
