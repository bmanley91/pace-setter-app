import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:pace_tracker_app/redux/app_state.dart';
import 'package:pace_tracker_app/redux/form_update_actions.dart';
import 'package:pace_tracker_app/util/converters.dart';
import 'package:pace_tracker_app/util/mappers.dart';
import 'package:pace_tracker_app/widgets/form/calculator_field.dart';
import 'package:pace_tracker_app/widgets/form/clear_button.dart';

import 'package:pace_tracker_app/util/keys.dart';
import 'package:pace_tracker_app/util/validators.dart';
import 'package:pace_tracker_app/widgets/form/distance_field.dart';

class PaceCalculator extends StatefulWidget {
  const PaceCalculator({super.key});

  @override
  State<StatefulWidget> createState() => _PaceCalculatorState();
}

class _PaceCalculatorState extends State<PaceCalculator> {
  final _distanceController = TextEditingController();
  final _timeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _PaceCalculatorViewModel>(
        builder: (BuildContext context, _PaceCalculatorViewModel viewModel) {
          return Form(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Text(
                    key: paceCalculatorMessageKey,
                    viewModel.paceString.isNotEmpty
                        ? 'Pace: ${viewModel.paceString} per ${viewModel.unitShortString}'
                        : 'Enter distance in ${viewModel.unitString} and total time to calculate pace',
                    style: const TextStyle(
                      fontSize: 24,
                    ),
                    textAlign: TextAlign.center,
                  )),
              DistanceField(
                controller: _distanceController,
                shouldUpdatePace: true,
              ),
              CalculatorField(
                  label: 'Time',
                  hint: 'Format hh:mm:ss',
                  onChanged: viewModel.onTimeChange,
                  controller: _timeController),
              ClearButton(
                controllersToClear: [_distanceController, _timeController],
              )
            ],
          ));
        },
        converter: (store) => _PaceCalculatorViewModel(
              paceString: secondsToTimeString(store.state.paceSeconds),
              distanceString: store.state.distanceNum.toString(),
              timeString: secondsToTimeString(store.state.timeSeconds),
              unitShortString: mapMetricStoreStateToShortString(
                  store.state.metricUnitsEnabled),
              unitString:
                  mapMetricStoreStateToString(store.state.metricUnitsEnabled),
              onTimeChange: (newTime) {
                if (isTimeValid(newTime)) {
                  store.dispatch(TimeUpdateAction(
                      time: timeStringToSeconds(newTime),
                      shouldCalcPace: true));
                }
              },
            ));
  }
}

class _PaceCalculatorViewModel {
  final String paceString;
  final String distanceString;
  final String timeString;
  final String unitString;
  final String unitShortString;
  final void Function(String newTime) onTimeChange;

  _PaceCalculatorViewModel(
      {required this.paceString,
      required this.distanceString,
      required this.timeString,
      required this.unitString,
      required this.unitShortString,
      required this.onTimeChange});
}
