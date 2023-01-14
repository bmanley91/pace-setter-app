import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:pace_tracker_app/redux/app_state.dart';
import 'package:pace_tracker_app/widgets/clear_button.dart';

import '../redux/form_update_actions.dart';
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

  final _distanceController = TextEditingController();
  final _paceController = TextEditingController();

  bool _shouldCalcTime(String distance, String pace) {
    final distValid = isDistanceValid(distance);
    final paceValid = isPaceValid(pace);
    return distValid && paceValid;
  }

  // void _handlePaceChanged(String newTime) {
  //   setState(() {
  //     debugPrint('Pace changed');
  //     _pace = newTime;
  //     if (_shouldCalcTime()) {
  //       debugPrint('Calculating Time');
  //       _time = calculateTime(_pace, _distance).toString();
  //     }
  //   });
  // }

  void _clearAll() {
    _distanceController.clear();
    _paceController.clear();
    setState(() {
      _distance = '';
      _pace = '';
      _time = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _TimeCalculatorViewModel>(
      builder: ((BuildContext context, _TimeCalculatorViewModel viewModel) {
        return Form(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Text(
                  viewModel.state.time.isNotEmpty
                      ? 'Total Time: ${viewModel.state.time}'
                      : 'Enter distance and pace to calculate total time',
                  style: const TextStyle(
                    fontSize: 24,
                  ),
                  textAlign: TextAlign.center,
                )),
            DistanceField(
              controller: _distanceController,
              shouldUpdateTime: _shouldCalcTime(
                  viewModel.state.distance, viewModel.state.pace),
            ),
            CalculatorField(
                label: 'Pace',
                value: _pace,
                hint: 'Format hh:mm:ss',
                onChanged: viewModel.onPaceChange,
                controller: _paceController),
            ClearButton(
              controllersToClear: [_distanceController, _paceController],
            )
          ]),
        );
      }),
      converter: (store) => _TimeCalculatorViewModel(
        state: store.state,
        onPaceChange: (newState) => store
            .dispatch(PaceUpdateAction(pace: newState, shouldCalcTime: true)),
      ),
    );
  }
}

class _TimeCalculatorViewModel {
  final AppState state;
  final void Function(String newState) onPaceChange;

  _TimeCalculatorViewModel({required this.state, required this.onPaceChange});
}
