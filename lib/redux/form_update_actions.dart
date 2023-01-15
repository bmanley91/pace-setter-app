abstract class FormUpdateAction {
  bool shouldCalcPace;
  bool shouldCalcTime;

  FormUpdateAction({this.shouldCalcPace = false, this.shouldCalcTime = false});

  @override
  String toString() {
    return 'FormUpdateAction {shouldCalcPace: $shouldCalcPace, shouldCalcTime: $shouldCalcTime}';
  }
}

class DistanceUpdateAction extends FormUpdateAction {
  double distance;

  DistanceUpdateAction(
      {required this.distance, super.shouldCalcPace, super.shouldCalcTime});
}

class PaceUpdateAction extends FormUpdateAction {
  double pace;

  PaceUpdateAction({required this.pace, super.shouldCalcTime});
}

class TimeUpdateAction extends FormUpdateAction {
  double time;

  TimeUpdateAction({required this.time, super.shouldCalcPace});
}

class FormClearAction {}
