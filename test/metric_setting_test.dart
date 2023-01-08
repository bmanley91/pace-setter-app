import 'package:flutter_test/flutter_test.dart';
import 'package:pace_tracker_app/redux/app_state.dart';
import 'package:pace_tracker_app/redux/metric_setting_reducer.dart';
import 'package:pace_tracker_app/redux/metric_state_action.dart';
import 'package:redux/redux.dart';

void main() {
  test('metric units are disabled by default', () {
    Store<AppState> testStore = Store(
      metricSettingReducer,
      initialState: AppState(),
    );

    expect(testStore.state.metricUnitsEnabled, false);
  });

  test('emitting a flip action will flip the value of the store', () {
    Store<AppState> testStore = Store(
      metricSettingReducer,
      initialState: AppState(),
    );
    testStore.dispatch(MetricStateActions.flip);
    expect(testStore.state.metricUnitsEnabled, true);
  });
}
