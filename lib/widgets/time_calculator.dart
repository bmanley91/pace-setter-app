import 'package:flutter/material.dart';

import '../util/calculators.dart';
import '../util/validators.dart';
import 'calculator_field.dart';
import 'distance_field.dart';

class TimeCalculator extends StatefulWidget {
  const TimeCalculator({super.key});

  @override
  State<StatefulWidget> createState() => _TimeCalculatorState();
}

class _TimeCalculatorState extends State<TimeCalculator> {
  String _distance = '';
  String _time = '';
  String _pace = '';

  bool _shouldCalcTime() {
    final distValid = isDistanceValid(_distance);
    final paceValid = isPaceValid(_pace);
    return distValid && paceValid;
  }

  void _handleDistanceChanged(String newDistance) {
    setState(() {
      debugPrint('Distance changed');
      _distance = newDistance;
      if (_shouldCalcTime()) {
        debugPrint('Calculating Time');
        _time = calculateTime(_pace, _distance).toString();
      }
    });
  }

  void _handlePaceChanged(String newTime) {
    setState(() {
      debugPrint('Pace changed');
      _pace = newTime;
      if (_shouldCalcTime()) {
        debugPrint('Calculating Time');
        _time = calculateTime(_pace, _distance).toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Text(
              _time.isNotEmpty
                  ? 'Total Time: $_time'
                  : 'Enter distance and pace to calculate total time',
              style: const TextStyle(
                fontSize: 24,
              ),
              textAlign: TextAlign.center,
            )),
        DistanceField(
          onChanged: _handleDistanceChanged,
        ),
        CalculatorField(
          label: 'Pace',
          value: _pace,
          hint: 'Format mm:ss',
          onChanged: _handlePaceChanged,
        ),
      ]),
    );
  }
}
