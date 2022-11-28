import 'dart:math';

double timeStringToSeconds(String timeString) {
  final timeNums =
      timeString.split(':').map((element) => double.parse(element));

  if (timeNums.length == 3) {
    final hourSeconds = timeNums.elementAt(0) * 3600;
    final minuteSeconds = timeNums.elementAt(1) * 60;
    final seconds = timeNums.elementAt(2);

    return hourSeconds + minuteSeconds + seconds;
  } else {
    final minuteSeconds = timeNums.elementAt(0) * 60;
    final seconds = timeNums.elementAt(1);

    return minuteSeconds + seconds;
  }
}

String secondsToTimeString(double inputSeconds) {
  final hours = inputSeconds ~/ 3600;
  final remainder = inputSeconds - hours * 3600;
  final minutes = remainder ~/ 60;
  final seconds = inputSeconds % 60;

  return hours != 0
      ? '$hours:${assureTwoChars(minutes)}:${assureTwoChars(roundDouble(seconds, 2))}'
      : '$minutes:${assureTwoChars(roundDouble(seconds, 2))}';
}

String assureTwoChars(var input) {
  String inputString = input.toString();

  return input < 10 ? '0$inputString' : inputString;
}

double roundDouble(double value, int places) {
  double mod = pow(10.0, places).toDouble();
  return ((value * mod).round().toDouble() / mod);
}
