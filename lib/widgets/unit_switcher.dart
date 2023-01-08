import 'package:flutter/material.dart';

class UnitSwitcher extends StatefulWidget {
  const UnitSwitcher({super.key});

  @override
  State<UnitSwitcher> createState() => _UnitSwitcherState();
}

class _UnitSwitcherState extends State<UnitSwitcher> {
  bool displayMetric = false;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
        title: const Text('Use Metric Units?'),
        value: displayMetric,
        secondary: const Icon(Icons.language),
        onChanged: ((value) => _flipSwitch(value)));
  }

  _flipSwitch(value) {
    setState(() {
      displayMetric = value;
    });
  }
}
