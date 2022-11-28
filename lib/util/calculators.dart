import 'converters.dart';

String calculateTime(String pace, String distance) =>
    secondsToTimeString(double.parse(distance) * timeStringToSeconds(pace));

String calculatePace(String time, String distance) =>
    secondsToTimeString(timeStringToSeconds(time) / double.parse(distance));
