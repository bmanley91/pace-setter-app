import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:pace_tracker_app/redux/app_state.dart';
import 'package:pace_tracker_app/util/keys.dart';
import 'package:pace_tracker_app/util/validators.dart';
import 'package:pace_tracker_app/widgets/form/clear_button.dart';

import 'package:pace_tracker_app/redux/form_update_actions.dart';
import 'package:pace_tracker_app/util/converters.dart';
import 'package:pace_tracker_app/widgets/form/calculator_field.dart';
import 'package:pace_tracker_app/widgets/form/distance_field.dart';

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
                  key: timeCalculatorMessageKey,
                  viewModel.timeString.isNotEmpty
                      ? 'Total Time: ${viewModel.timeString}'
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
        timeString: secondsToTimeString(store.state.timeSeconds),
        onPaceChange: (newPace) {
          if (isPaceValid(newPace)) {
            store.dispatch(PaceUpdateAction(
                pace: timeStringToSeconds(newPace), shouldCalcTime: true));
          }
        },
      ),
    );
  }
}

class _TimeCalculatorViewModel {
  final String timeString;
  final void Function(String newState) onPaceChange;

  _TimeCalculatorViewModel(
      {required this.timeString, required this.onPaceChange});
}
