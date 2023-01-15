import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pace_tracker_app/redux/app_state.dart';
import 'package:pace_tracker_app/redux/form_update_reducer.dart';
import 'package:pace_tracker_app/redux/metric_setting_reducer.dart';
import 'package:pace_tracker_app/widgets/clear_button.dart';
import 'package:redux/redux.dart';

void main() {
  final controller = TextEditingController(text: 'foobar');
  late Widget testApp;
  late ClearButton clearButton;
  late Store<AppState> store;

  setUp(() {
    clearButton = ClearButton(
      controllersToClear: [controller],
    );
    store = Store<AppState>(
        combineReducers({metricSettingReducer, formUpdateReducer}),
        initialState: AppState(
            distance: '123',
            distanceNum: 123.0,
            time: '5:43:21',
            timeSeconds: 555,
            pace: '43:12',
            paceSeconds: 999));
    testApp = StoreProvider<AppState>(
        store: store, child: MaterialApp(home: Scaffold(body: clearButton)));
  });

  testWidgets(
      'Pressing the button clears all controllers and distance, time, and pace from state',
      (WidgetTester tester) async {
    await tester.pumpWidget(testApp);

    await tester.tap(find.byWidget(clearButton));

    expect(store.state.distance, '');
    expect(store.state.distanceNum, 0);
    expect(store.state.time, '');
    expect(store.state.timeSeconds, 0);
    expect(store.state.pace, '');
    expect(store.state.paceSeconds, 0);

    expect(controller.text, '');
  });
}
