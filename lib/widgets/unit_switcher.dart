import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:pace_tracker_app/redux/metric_state_action.dart';

class UnitSwitcher extends StatefulWidget {
  const UnitSwitcher({super.key});

  @override
  State<UnitSwitcher> createState() => _UnitSwitcherState();
}

class _UnitSwitcherState extends State<UnitSwitcher> {
  bool displayMetric = false;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<bool, VoidCallback>(builder: (context, callback) {
      return SwitchListTile(
          title: const Text('Use Metric Units?'),
          value: displayMetric,
          secondary: const Icon(Icons.language),
          onChanged: (value) => {_flipSwitch(value, callback)});
    }, converter: (store) {
      return () => store.dispatch(MetricStateActions.Flip);
    });
  }

  void _flipSwitch(bool newValue, VoidCallback callback) {
    setState(() {
      displayMetric = newValue;
    });
    callback();
  }
}
