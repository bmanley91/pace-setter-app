final _distanceRegex = RegExp('[0-9.]*');
final _paceRegex = RegExp('([0-9]{1,2}):([0-5][0-9])?');
final _timeRegex = RegExp('([0-9]{1,2}):([0-5][0-9])(:[0-9]{2})?');

bool isDistanceValid(String input) =>
    input.isNotEmpty && _distanceRegex.hasMatch(input);

bool isPaceValid(String input) => _paceRegex.hasMatch(input);

bool isTimeValid(String input) => _timeRegex.hasMatch(input);
