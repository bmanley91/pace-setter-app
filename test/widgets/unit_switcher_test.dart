import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pace_tracker_app/redux/app_state.dart';
import 'package:pace_tracker_app/redux/metric_setting_reducer.dart';
import 'package:pace_tracker_app/widgets/settings/unit_switcher.dart';
import 'package:redux/redux.dart';

class MockStore extends Mock implements Store<AppState> {}

void main() {
  const testKey = Key('test');
  late Widget testApp;
  late UnitSwitcher unitSwitcher;

  setUp(() {
    unitSwitcher = const UnitSwitcher(
      key: testKey,
    );
    testApp = StoreProvider<AppState>(
      store: _store,
      child: MaterialApp(
        home: Scaffold(
          body: unitSwitcher,
        ),
      ),
    );
  });

  testWidgets('Unit Switcher initial state renders correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(testApp);

    expect(find.text('Use Metric Units?'), findsOneWidget);
    expect(find.byIcon(Icons.language), findsOneWidget);
    expect(
        find.byWidgetPredicate(
            (widget) => widget is SwitchListTile && widget.value == false),
        findsOneWidget);
  });

  testWidgets(
      'Flipping the switch updates the metricUnitsEnabled value in state',
      (WidgetTester tester) async {
    await tester.pumpWidget(testApp);

    await tester.tap(find.byWidget(unitSwitcher));

    expect(_store.state.metricUnitsEnabled, true);
  });
}

final _store = Store<AppState>(
  metricSettingReducer,
  initialState: AppState(),
);
