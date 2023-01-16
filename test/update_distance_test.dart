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
    const initialTime = 1.23;
    const initialPace = 3.21;
    const initialDistance = 11.0;
    const updatedDistance = 22.0;
    Store<AppState> testStore = Store(
      combineReducers({metricSettingReducer, formUpdateReducer}),
      initialState: AppState(
          distanceNum: initialDistance,
          timeSeconds: initialTime,
          paceSeconds: initialPace),
    );

    testStore.dispatch(DistanceUpdateAction(distance: updatedDistance));

    expect(testStore.state.distanceNum, updatedDistance);
    expect(testStore.state.timeSeconds, initialTime);
    expect(testStore.state.paceSeconds, initialPace);
  });

  test('Updating distance and flagging to update pace recalculates pace', () {
    const initialDistance = 10.0;
    const updatedDistance = 5.0;
    const time = 6000.0;
    const initialPace = 600.0;
    const expectedCalculatedPace = 1200.0;

    Store<AppState> testStore = Store(
      combineReducers({metricSettingReducer, formUpdateReducer}),
      initialState: AppState(
          distanceNum: initialDistance,
          timeSeconds: time,
          paceSeconds: initialPace),
    );

    testStore.dispatch(
        DistanceUpdateAction(distance: updatedDistance, shouldCalcPace: true));

    expect(testStore.state.distanceNum, updatedDistance);
    expect(testStore.state.timeSeconds, time);
    expect(testStore.state.paceSeconds, expectedCalculatedPace);
  });

  test('Updating distance and flagging to update time recalculates time', () {
    const initialDistance = 1.0;
    const updatedDistance = 3.5;
    const pace = 1000.0;
    const initialTime = 1000.0;
    const expectedCalculatedTime = 3500.0;

    Store<AppState> testStore = Store(
      combineReducers({metricSettingReducer, formUpdateReducer}),
      initialState: AppState(
          distanceNum: initialDistance,
          timeSeconds: initialTime,
          paceSeconds: pace),
    );

    testStore.dispatch(
        DistanceUpdateAction(distance: updatedDistance, shouldCalcTime: true));

    expect(testStore.state.distanceNum, updatedDistance);
    expect(testStore.state.timeSeconds, expectedCalculatedTime);
    expect(testStore.state.paceSeconds, pace);
  });
}
