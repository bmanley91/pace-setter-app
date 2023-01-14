import 'package:flutter_test/flutter_test.dart';
import 'package:pace_tracker_app/redux/app_state.dart';
import 'package:pace_tracker_app/redux/form_update_actions.dart';
import 'package:pace_tracker_app/redux/form_update_reducer.dart';
import 'package:pace_tracker_app/redux/metric_setting_reducer.dart';
import 'package:redux/redux.dart';

void main() {
  test(
      'Updating distance without flagging recalculation does not update pace or time',
      () {
    const initialTime = '1:23';
    const initialPace = '3:21';
    const initialDistance = '11';
    const updatedDistance = '22';
    Store<AppState> testStore = Store(
      combineReducers({metricSettingReducer, formUpdateReducer}),
      initialState: AppState(
          distance: initialDistance, time: initialTime, pace: initialPace),
    );

    testStore.dispatch(DistanceUpdateAction(distance: updatedDistance));

    expect(testStore.state.distance, updatedDistance);
    expect(testStore.state.time, initialTime);
    expect(testStore.state.pace, initialPace);
  });

  test('Updating distance and flagging to update pace recalculates pace', () {
    const initialTime = '23:03.0';
    const initialPace = '7:26.0';
    const updatedPace = '6:35.14';
    const initialDistance = '3.1';
    const updatedDistance = '3.5';

    Store<AppState> testStore = Store(
      combineReducers({metricSettingReducer, formUpdateReducer}),
      initialState: AppState(
          distance: initialDistance, time: initialTime, pace: initialPace),
    );

    testStore.dispatch(
        DistanceUpdateAction(distance: updatedDistance, shouldCalcPace: true));

    expect(testStore.state.distance, updatedDistance);
    expect(testStore.state.time, initialTime);
    expect(testStore.state.pace, updatedPace);
  });

  test('Updating distance and flagging to update time recalculates time', () {
    const initialTime = '24:48.0';
    const updatedTime = '35:00.0';
    const initialPace = '7:00.0';
    const initialDistance = '3.1';
    const updatedDistance = '5';

    Store<AppState> testStore = Store(
      combineReducers({metricSettingReducer, formUpdateReducer}),
      initialState: AppState(
          distance: initialDistance, time: initialTime, pace: initialPace),
    );

    testStore.dispatch(
        DistanceUpdateAction(distance: updatedDistance, shouldCalcTime: true));

    expect(testStore.state.distance, updatedDistance);
    expect(testStore.state.time, updatedTime);
    expect(testStore.state.pace, initialPace);
  });
}
