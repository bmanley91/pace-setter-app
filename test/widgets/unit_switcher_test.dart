import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pace_tracker_app/redux/app_state.dart';
import 'package:pace_tracker_app/redux/metric_setting_reducer.dart';
import 'package:pace_tracker_app/widgets/unit_switcher.dart';
import 'package:redux/redux.dart';

class MockStore extends Mock implements Store<AppState> {}

void main() {
  testWidgets('Unit Switcher initial state renders correctly',
      (WidgetTester tester) async {
    const testKey = Key('test');

    await tester.pumpWidget(StoreProvider<AppState>(
      store: _store,
      child: const MaterialApp(
        home: Scaffold(
          body: UnitSwitcher(
            key: testKey,
          ),
        ),
      ),
    ));

    expect(find.text('Use Metric Units?'), findsOneWidget);
    expect(find.byIcon(Icons.language), findsOneWidget);
    expect(
        find.byWidgetPredicate(
            (widget) => widget is SwitchListTile && widget.value == false),
        findsOneWidget);
  });

  // testWidgets('', callback)
}

final _store = Store<AppState>(
  metricSettingReducer,
  initialState: AppState(),
);
