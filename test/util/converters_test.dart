import 'package:flutter_test/flutter_test.dart';
import 'package:pace_tracker_app/util/converters.dart';

void main() {
  test('timeStringToSeconds coverts a time string to seconds', () {
    const expectedSeconds = 5025.6;
    final actualSeconds = timeStringToSeconds('1:23:45.6');
    expect(actualSeconds, expectedSeconds);
  });

  test('secondsToTimeString coverts a time string to seconds', () {
    const expectedTimeString = '3:25:45.6';
    final actualTimeString = secondsToTimeString(12345.6);
    expect(actualTimeString, expectedTimeString);
  });
}
