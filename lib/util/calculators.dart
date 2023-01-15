import 'package:flutter/foundation.dart';

import 'converters.dart';

String calculateTime(String pace, double distance) {
  debugPrint('Calculating time with pace: $pace, distance: $distance');
  return secondsToTimeString(distance * timeStringToSeconds(pace));
}

String calculatePace(String time, double distance) {
  debugPrint('NEW - Calculating pace with time: $time, distance: $distance');
  return secondsToTimeString(timeStringToSeconds(time) / distance);
}

double calculateTimeSeconds(double paceSeconds, double distanceNum) =>
    paceSeconds * distanceNum;

double calculatePaceSeconds(double timeSeconds, double distanceNum) =>
    timeSeconds / distanceNum;
