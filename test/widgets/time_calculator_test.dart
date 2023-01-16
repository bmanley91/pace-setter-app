import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pace_tracker_app/redux/app_state.dart';
import 'package:pace_tracker_app/redux/form_update_reducer.dart';
import 'package:pace_tracker_app/redux/metric_setting_reducer.dart';
import 'package:pace_tracker_app/util/keys.dart';
import 'package:pace_tracker_app/widgets/time_calculator.dart';
import 'package:redux/redux.dart';

void main() {
  late Widget testApp;
  late TimeCalculator timeCalculator;
  late Store<AppState> store;

  setUp(() {
    timeCalculator = const TimeCalculator();
    store = Store<AppState>(
        combineReducers({metricSettingReducer, formUpdateReducer}),
        initialState: AppState());
    testApp = StoreProvider<AppState>(
        store: store, child: MaterialApp(home: Scaffold(body: timeCalculator)));
  });

  testWidgets('Time Calculator loads correctly when no fields are set',
      (WidgetTester tester) async {
    await tester.pumpWidget(testApp);

    final messageElements = find.byKey(timeCalculatorMessageKey).evaluate();
    expect(messageElements.length, 1);

    final message = messageElements.first.widget as Text;
    expect(message.data, 'Enter distance and pace to calculate total time');
  });
}
