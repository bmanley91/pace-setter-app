import 'package:flutter_test/flutter_test.dart';
import 'package:pace_tracker_app/redux/app_state.dart';
import 'package:pace_tracker_app/redux/settings_reducer.dart';
import 'package:pace_tracker_app/widgets/app_wrapper.dart';
import 'package:redux/redux.dart';

void main() {
  testWidgets('The App loads with basic scaffolding',
      (WidgetTester tester) async {
    // Build HomePage
    await tester.pumpWidget(AppWrapper(
      appStore: _store,
    ));

    final titleFinder = find.text('Pace Checker');

    expect(titleFinder, findsOneWidget);
  });
}

final _store = Store<AppState>(
  settingsReducer,
  initialState: AppState(),
);
