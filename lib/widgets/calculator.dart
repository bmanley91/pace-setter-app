import 'package:flutter/material.dart';
import 'package:pace_tracker_app/widgets/calculator_field.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<StatefulWidget> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _distance = '';
  String _pace = '';
  String _time = '';

  void _handleDistanceChanged(String newDistance) {
    setState(() {
      _distance = newDistance;
    });
  }

  void _handlePaceChanged(String newPace) {
    setState(() {
      _pace = newPace;
    });
  }

  void _handleTimeChanged(String newTime) {
    setState(() {
      _time = newTime;
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
            onChanged: _handleDistanceChanged),
        CalculatorField(
          label: 'Pace',
          value: _pace,
          hint: 'Format mm:ss',
          onChanged: _handlePaceChanged,
        ),
        CalculatorField(
          label: 'Time',
          value: _time,
          hint: 'Format hh:mm:ss',
          onChanged: _handleTimeChanged,
        ),
      ],
    ));
  }
}
