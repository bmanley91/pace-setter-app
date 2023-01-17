import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pace_tracker_app/redux/app_state.dart';
import 'package:pace_tracker_app/redux/settings_reducer.dart';
import 'package:pace_tracker_app/widgets/settings/dark_mode_switch.dart';
import 'package:redux/redux.dart';

void main() {
  late Widget testApp;
  late DarkModeSwitch darkModeSwitch;

  setUp(() {
    darkModeSwitch = const DarkModeSwitch();
    testApp = StoreProvider<AppState>(
      store: _store,
      child: MaterialApp(
        home: Scaffold(
          body: darkModeSwitch,
        ),
      ),
    );
  });

  testWidgets('Dark Mode Switch initial state renders correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(testApp);

    expect(find.text('Dark Mode'), findsOneWidget);
    expect(find.byIcon(Icons.dark_mode), findsOneWidget);
    expect(
        find.byWidgetPredicate(
            (widget) => widget is SwitchListTile && widget.value == false),
        findsOneWidget);
  });

  testWidgets('Flipping the Dark Mode Switch updates the darkModeEnabled value',
      (WidgetTester tester) async {
    await tester.pumpWidget(testApp);

    await tester.tap(find.byWidget(darkModeSwitch));

    expect(_store.state.darkModeEnabled, true);
  });
}

final _store = Store<AppState>(
  settingsReducer,
  initialState: AppState(),
);
