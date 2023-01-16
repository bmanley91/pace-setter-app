import 'package:flutter_test/flutter_test.dart';
import 'package:pace_tracker_app/redux/app_state.dart';
import 'package:pace_tracker_app/redux/form_update_actions.dart';
import 'package:pace_tracker_app/redux/form_update_reducer.dart';
import 'package:pace_tracker_app/redux/metric_setting_reducer.dart';
import 'package:redux/redux.dart';

void main() {
  test(
      'Updating time without flagging pace recalculation does not update any other values',
      () {
    const initialTime = 3100.0;
    const updatedTime = 4500.0;
    const initialPace = 1000.0;
    const distance = 3.1;

    Store<AppState> testStore = Store(
      combineReducers({metricSettingReducer, formUpdateReducer}),
      initialState: AppState(
          distanceNum: distance,
          timeSeconds: initialTime,
          paceSeconds: initialPace),
    );

    testStore.dispatch(TimeUpdateAction(time: updatedTime));

    expect(testStore.state.distanceNum, distance);
    expect(testStore.state.timeSeconds, updatedTime);
    expect(testStore.state.paceSeconds, initialPace);
  });

  test('Updating time and flagging pace recalculation updates pace', () {
    const initialTime = 100.0;
    const updatedTime = 200.0;
    const distance = 5.0;
    const initialPace = 20.0;
    const expectedCalculatedPace = 40.0;

    Store<AppState> testStore = Store(
      combineReducers({metricSettingReducer, formUpdateReducer}),
      initialState: AppState(
          distanceNum: distance,
          timeSeconds: initialTime,
          paceSeconds: initialPace),
    );

    testStore
        .dispatch(TimeUpdateAction(time: updatedTime, shouldCalcPace: true));

    expect(testStore.state.distanceNum, distance);
    expect(testStore.state.timeSeconds, updatedTime);
    expect(testStore.state.paceSeconds, expectedCalculatedPace);
  });
}
