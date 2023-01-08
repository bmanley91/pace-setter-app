import 'package:flutter_test/flutter_test.dart';
import 'package:pace_tracker_app/redux/metric_setting_reducer.dart';
import 'package:pace_tracker_app/redux/metric_state_action.dart';
import 'package:redux/redux.dart';

void main() {
  test('emitting a flip action will flip the value of the store', () {
    Store<bool> testStore = Store(
      metricSettingReducer,
      initialState: false,
    );
    testStore.dispatch(MetricStateActions.flip);
    expect(testStore.state, true);
  });
}
