import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:pace_tracker_app/redux/app_state.dart';
import 'package:pace_tracker_app/widgets/clear_button.dart';

import '../redux/form_update_actions.dart';
import 'calculator_field.dart';
import 'distance_field.dart';

class TimeCalculator extends StatefulWidget {
  const TimeCalculator({super.key});

  @override
  State<StatefulWidget> createState() => _TimeCalculatorState();
}

class _TimeCalculatorState extends State<TimeCalculator> {
  final _distanceController = TextEditingController();
  final _paceController = TextEditingController();

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
              shouldUpdateTime: true,
            ),
            CalculatorField(
                label: 'Pace',
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
