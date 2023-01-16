import 'package:flutter_test/flutter_test.dart';
import 'package:pace_tracker_app/redux/app_state.dart';

void main() {
  test('AppState can be loaded from json', () {
    const distanceNum = 1.2;
    const timeSeconds = 9.8;
    const paceSeconds = 5.4;
    const metricUnitsEnabled = true;
    final expectedState = AppState(
        distanceNum: distanceNum,
        timeSeconds: timeSeconds,
        paceSeconds: paceSeconds,
        metricUnitsEnabled: metricUnitsEnabled);
    const json = {
      'metricUnitsEnabled': metricUnitsEnabled,
      'distanceNum': distanceNum,
      'timeSeconds': timeSeconds,
      'paceSeconds': paceSeconds
    };

    final actualState = AppState.fromJson(json);

    expect(actualState.distanceNum, expectedState.distanceNum);
    expect(actualState.timeSeconds, expectedState.timeSeconds);
    expect(actualState.paceSeconds, expectedState.paceSeconds);
    expect(actualState.metricUnitsEnabled, expectedState.metricUnitsEnabled);
  });
}
