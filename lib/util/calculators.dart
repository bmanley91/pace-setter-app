import 'converters.dart';

double calculateTime(double pace, double distance) => distance * pace;

String calculatePace(String time, String distance) =>
    secondsToTimeString(timeStringToSeconds(time) / double.parse(distance));
