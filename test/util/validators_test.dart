import 'package:flutter_test/flutter_test.dart';
import 'package:pace_tracker_app/util/validators.dart';

void main() {
  test('isPaceValid flags a valid time string as valid', () {
    const timeString = '9:87.6';
    final evaluation = isPaceValid(timeString);
    expect(evaluation, true);
  });

  test('isPaceValid flags an invalid time string as invalid', () {
    const timeString = 'abc';
    final evaluation = isPaceValid(timeString);
    expect(evaluation, false);
  });

  test('isTimeValid flags a valid time string as valid', () {
    const timeString = '0:19:87.6';
    final evaluation = isTimeValid(timeString);
    expect(evaluation, true);
  });

  test('isTimeValid flags a valid time string with hours as valid', () {
    const timeString = '1:19:87.6';
    final evaluation = isTimeValid(timeString);
    expect(evaluation, true);
  });

  test('isTimeValid flags an invalid time string as invalid', () {
    const timeString = 'abc';
    final evaluation = isTimeValid(timeString);
    expect(evaluation, false);
  });
}
