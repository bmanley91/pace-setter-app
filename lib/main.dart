import 'package:flutter/material.dart';
import 'package:pace_tracker_app/redux/app_state.dart';
import 'package:pace_tracker_app/redux/form_update_reducer.dart';
import 'package:pace_tracker_app/redux/metric_setting_reducer.dart';
import 'package:pace_tracker_app/widgets/pace_checker_app.dart';
import 'package:redux/redux.dart';
import 'package:redux_persist/redux_persist.dart';
import 'package:redux_persist_flutter/redux_persist_flutter.dart';

void main() async {
  // If we don't do this the app just doesn't load
  WidgetsFlutterBinding.ensureInitialized();

  final persistor = Persistor<AppState>(
    storage: FlutterStorage(),
    serializer: JsonSerializer<AppState>(AppState.fromJson),
  );

  final initialState = await persistor.load();

  final store = Store<AppState>(
    combineReducers({
      formUpdateReducer,
      metricSettingReducer,
    }),
    initialState: initialState ?? AppState(),
    middleware: [persistor.createMiddleware()],
  );

  runApp(PaceCheckerApp(
    appStore: store,
  ));
}
