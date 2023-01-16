import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pace_tracker_app/redux/app_state.dart';
import 'package:pace_tracker_app/redux/form_update_reducer.dart';
import 'package:pace_tracker_app/redux/metric_setting_reducer.dart';
import 'package:pace_tracker_app/util/keys.dart';
import 'package:pace_tracker_app/widgets/pace_calculator.dart';
import 'package:redux/redux.dart';

void main() {
  late Widget testApp;
  late PaceCalculator paceCalculator;
  late Store<AppState> store;

  setUp(() {
    paceCalculator = const PaceCalculator();
  });

  testWidgets('Pace Calculator loads correctly when no fields are set',
      (WidgetTester tester) async {
    store = Store<AppState>(
        combineReducers({metricSettingReducer, formUpdateReducer}),
        initialState: AppState());
    testApp = StoreProvider<AppState>(
        store: store, child: MaterialApp(home: Scaffold(body: paceCalculator)));
    await tester.pumpWidget(testApp);

    expect(
        find.text('Enter distance in miles and total time to calculate pace'),
        findsOneWidget);
  });

  testWidgets(
      'Pace Calculator loads correctly when no fields are set and metric units enabled',
      (WidgetTester tester) async {
    store = Store<AppState>(
        combineReducers({metricSettingReducer, formUpdateReducer}),
        initialState: AppState());
    testApp = StoreProvider<AppState>(
        store: store, child: MaterialApp(home: Scaffold(body: paceCalculator)));
    await tester.pumpWidget(testApp);

    expect(
        find.text(
            'Enter distance in kilometers and total time to calculate pace'),
        findsOneWidget);
  });

  testWidgets('Pace Calculator loads correctly fields are set',
      (WidgetTester tester) async {
    store = Store<AppState>(
        combineReducers({metricSettingReducer, formUpdateReducer}),
        initialState:
            AppState(paceSeconds: 600, distanceNum: 5, timeSeconds: 3000));
    testApp = StoreProvider<AppState>(
        store: store, child: MaterialApp(home: Scaffold(body: paceCalculator)));
    await tester.pumpWidget(testApp);

    final messageElements = find.byKey(paceCalculatorMessageKey).evaluate();
    expect(messageElements.length, 1);

    final message = messageElements.first.widget as Text;
    expect(message.data, 'Pace: 10:00.0 per mi');
  });

  testWidgets(
      'Pace Calculator loads correctly fields are set and metric units are enabled',
      (WidgetTester tester) async {
    store = Store<AppState>(
        combineReducers({metricSettingReducer, formUpdateReducer}),
        initialState: AppState(
            paceSeconds: 600,
            distanceNum: 5,
            timeSeconds: 3000,
            metricUnitsEnabled: true));
    testApp = StoreProvider<AppState>(
        store: store, child: MaterialApp(home: Scaffold(body: paceCalculator)));
    await tester.pumpWidget(testApp);

    final messageElements = find.byKey(paceCalculatorMessageKey).evaluate();
    expect(messageElements.length, 1);

    final message = messageElements.first.widget as Text;
    expect(message.data, 'Pace: 10:00.0 per km');
  });
}
