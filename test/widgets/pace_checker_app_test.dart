import 'package:flutter_test/flutter_test.dart';
import 'package:pace_tracker_app/redux/app_state.dart';
import 'package:pace_tracker_app/redux/metric_setting_reducer.dart';
import 'package:pace_tracker_app/widgets/pace_checker_app.dart';
import 'package:redux/redux.dart';

void main() {
  testWidgets('The App loads with basic scaffolding',
      (WidgetTester tester) async {
    // Build HomePage
    await tester.pumpWidget(PaceCheckerApp(
      appStore: store,
    ));

    final titleFinder = find.text('Pace Checker');

    expect(titleFinder, findsOneWidget);
  });
}

final store = Store<AppState>(
  metricSettingReducer,
  initialState: AppState(),
);
