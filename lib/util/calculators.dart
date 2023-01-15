import 'package:flutter/foundation.dart';

import 'converters.dart';

String calculateTime(String pace, String distance) {
  debugPrint('Calculating time with pace: $pace, distance: $distance');
  return secondsToTimeString(
      double.parse(distance) * timeStringToSeconds(pace));
}

String calculatePace(String time, String distance) {
  debugPrint('Calculating pace with time: $time, distance: $distance');
  return secondsToTimeString(
      timeStringToSeconds(time) / double.parse(distance));
}

double calculateTimeSeconds(double paceSeconds, double distanceNum) =>
    paceSeconds * distanceNum;

double calculatePaceSeconds(double timeSeconds, double distanceNum) =>
    distanceNum / timeSeconds;
