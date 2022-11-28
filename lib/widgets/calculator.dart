import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/formatters/masked_input_formatter.dart';
import 'package:pace_tracker_app/util/calculators.dart';
import 'package:pace_tracker_app/util/validators.dart';
import 'package:pace_tracker_app/widgets/calculator_field.dart';

import '../util/converters.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<StatefulWidget> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _distance = '';
  final _distanceController = TextEditingController();

  String _pace = '';
  double _paceSeconds = 0;
  final _paceController = TextEditingController();

  String _time = '';
  double _timeSeconds = 0;
  final _timeController = TextEditingController();

  bool _shouldCalcTime() => isDistanceValid(_distance) && isPaceValid(_pace);

  bool _shouldCalcPace() => isDistanceValid(_distance) && isTimeValid(_time);

  @override
  void initState() {
    _paceController.addListener(() { })
    super.initState();
  }

  void _handleDistanceChanged(String newDistance) {
    setState(() {
      _distance = newDistance;
      debugPrint('Distance changed!');
      if (_shouldCalcTime()) {
        debugPrint('Should calc time!');
        _paceSeconds = timeStringToSeconds(_pace);
        _time = secondsToTimeString(
            calculateTime(_paceSeconds, double.parse(_distance)));
        _timeController.text = _time;
        debugPrint('Time is now $_time');
      }
    });
  }

  void _handlePaceChanged(String newPace) {
    setState(() {
      _pace = newPace;
      debugPrint('Pace changed!');
      if (_shouldCalcTime()) {
        debugPrint('Should calc time!');
      }
    });
  }

  void _handleTimeChanged(String newTime) {
    setState(() {
      _time = newTime;
      debugPrint('Time changed!');
      if (_shouldCalcPace()) {
        debugPrint('Should calc pace!');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CalculatorField(
          label: 'Distance',
          value: _distance,
          hint: 'Distance in miles',
          onChanged: _handleDistanceChanged,
          keyboardType: TextInputType.number,
          controller: _distanceController,
        ),
        CalculatorField(
            label: 'Pace',
            value: _pace,
            hint: 'Format mm:ss',
            onChanged: _handlePaceChanged,
            inputMasks: [MaskedInputFormatter('##:##.###')],
            controller: _paceController),
        CalculatorField(
          label: 'Time',
          value: _time,
          hint: 'Format hh:mm:ss',
          onChanged: _handleTimeChanged,
          inputMasks: [MaskedInputFormatter('##:##:##.###')],
          controller: _timeController,
        ),
      ],
    ));
  }
}
