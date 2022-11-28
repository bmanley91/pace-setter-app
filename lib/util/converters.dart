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
      ? '$hours:${assureTwoChars(minutes)}:${assureTwoChars(seconds)}'
      : '$minutes:${assureTwoChars(seconds)}';
}

String assureTwoChars(var input) {
  String inputString = input.toString();

  return input < 10 ? '0$inputString' : inputString;
}
