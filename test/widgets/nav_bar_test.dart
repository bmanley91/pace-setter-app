import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pace_tracker_app/redux/app_state.dart';
import 'package:pace_tracker_app/redux/form_update_reducer.dart';
import 'package:pace_tracker_app/redux/settings_reducer.dart';
import 'package:pace_tracker_app/widgets/nav/nav_bar.dart';
import 'package:redux/redux.dart';

void main() {
  final double initialPace = 1;
  final double initialTime = 2;
  final double initialDistance = 3;

  final store = Store<AppState>(
    combineReducers({settingsReducer, formUpdateReducer}),
    initialState: AppState(
        distanceNum: initialDistance,
        paceSeconds: initialPace,
        timeSeconds: initialTime),
  );

  late Widget testApp;
  bool mockCalled = false;

  setUp(() {
    testApp = StoreProvider<AppState>(
        store: store,
        child: MaterialApp(
            home: Scaffold(
          bottomNavigationBar:
              NavBar(onTap: (value) => mockCalled = true, currentIndex: 0),
        )));
  });

  testWidgets(
      'Nav Bar clears form data if a value other than the current index is tapped',
      (WidgetTester tester) async {
    await tester.pumpWidget(testApp);

    await tester.tap(find.byIcon(Icons.schedule));

    expect(mockCalled, true);
    expect(store.state.distanceNum, 0);
    expect(store.state.paceSeconds, 0);
    expect(store.state.timeSeconds, 0);
  });
}
