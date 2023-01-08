import 'package:flutter_test/flutter_test.dart';
import 'package:pace_tracker_app/redux/metric_setting_store.dart';
import 'package:pace_tracker_app/widgets/pace_checker_app.dart';

void main() {
  testWidgets('The App loads with basic scaffolding',
      (WidgetTester tester) async {
    // Build HomePage
    await tester.pumpWidget(PaceCheckerApp(
      metricSettingStore: metricSettingStore,
    ));

    final titleFinder = find.text('Pace Checker');

    expect(titleFinder, findsOneWidget);
  });
}
