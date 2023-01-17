import 'package:flutter_test/flutter_test.dart';
import 'package:pace_tracker_app/redux/app_state.dart';
import 'package:pace_tracker_app/redux/settings_reducer.dart';
import 'package:pace_tracker_app/redux/settings_actions.dart';
import 'package:redux/redux.dart';

void main() {
  test('metric units are disabled by default', () {
    Store<AppState> testStore = Store(
      settingsReducer,
      initialState: AppState(),
    );

    expect(testStore.state.metricUnitsEnabled, false);
  });

  test(
      'emitting a MetricUnitSettingUpdateAction will flip the value of the store',
      () {
    Store<AppState> testStore = Store(
      settingsReducer,
      initialState: AppState(),
    );
    testStore.dispatch(MetricUnitSettingUpdateAction());
    expect(testStore.state.metricUnitsEnabled, true);
  });

  test('dark mode is disabled by default', () {
    Store<AppState> testStore = Store(
      settingsReducer,
      initialState: AppState(),
    );

    expect(testStore.state.darkModeEnabled, false);
  });

  test(
      'emitting a DarkModeSettingUpdateAction  will flip the value of the store',
      () {
    Store<AppState> testStore = Store(
      settingsReducer,
      initialState: AppState(),
    );
    testStore.dispatch(DarkModeSettingUpdateAction());
    expect(testStore.state.darkModeEnabled, true);
  });
}
