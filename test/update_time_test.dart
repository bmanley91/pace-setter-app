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
    const initialTime = '31:00.0';
    const updatedTime = '45:00.0';
    const initialPace = '10:00.0';
    const distance = 3.1;

    Store<AppState> testStore = Store(
      combineReducers({metricSettingReducer, formUpdateReducer}),
      initialState:
          AppState(distanceNum: distance, time: initialTime, pace: initialPace),
    );

    testStore.dispatch(TimeUpdateAction(time: updatedTime));

    expect(testStore.state.distanceNum, distance);
    expect(testStore.state.time, updatedTime);
    expect(testStore.state.pace, initialPace);
  });

  test('Updating time and flagging pace recalculation updates pace', () {
    const initialTime = '31:00.0';
    const updatedTime = '45:00.0';
    const initialPace = '10:00.0';
    const updatedPace = '14:30.97';
    const distance = 3.1;

    Store<AppState> testStore = Store(
      combineReducers({metricSettingReducer, formUpdateReducer}),
      initialState:
          AppState(distanceNum: distance, time: initialTime, pace: initialPace),
    );

    testStore
        .dispatch(TimeUpdateAction(time: updatedTime, shouldCalcPace: true));

    expect(testStore.state.distanceNum, distance);
    expect(testStore.state.time, updatedTime);
    expect(testStore.state.pace, updatedPace);
  });
}
