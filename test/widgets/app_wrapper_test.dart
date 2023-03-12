import 'package:flutter_test/flutter_test.dart';
import 'package:pace_tracker_app/redux/app_state.dart';
import 'package:pace_tracker_app/redux/settings_reducer.dart';
import 'package:pace_tracker_app/util/analytics.dart';
import 'package:pace_tracker_app/widgets/app_wrapper.dart';
import 'package:redux/redux.dart';
import 'package:mockito/mockito.dart';

class MockAnalyticsClient extends Mock implements AnalyticsClient {}

void main() {
  late AnalyticsClient mockAnalyticsClient;
  late AppWrapper appWrapper;

  setUp(
    () {
      mockAnalyticsClient = MockAnalyticsClient();
      when(mockAnalyticsClient.logPageLoad()).thenReturn(null);
      appWrapper = AppWrapper(
        appStore: _store,
        analyticsClient: mockAnalyticsClient,
      );
    },
  );

  testWidgets(
    'The App loads with basic scaffolding',
    (WidgetTester tester) async {
      // Build HomePage
      await tester.pumpWidget(
        appWrapper,
      );

      final titleFinder = find.text('Pace Checker');

      expect(titleFinder, findsOneWidget);
      verify(mockAnalyticsClient.logPageLoad()).called(1);
    },
  );
}

final _store = Store<AppState>(
  settingsReducer,
  initialState: AppState(),
);
