import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:pace_tracker_app/redux/app_state.dart';
import 'package:pace_tracker_app/redux/form_update_actions.dart';
import 'package:pace_tracker_app/util/mappers.dart';

class DistanceField extends StatefulWidget {
  final TextEditingController controller;
  final bool shouldUpdatePace;
  final bool shouldUpdateTime;

  const DistanceField(
      {super.key,
      required this.controller,
      this.shouldUpdatePace = false,
      this.shouldUpdateTime = false});

  @override
  State<StatefulWidget> createState() => _DistanceFieldState();
}

class _DistanceFieldState extends State<DistanceField> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _DistanceFieldViewModel>(
        converter: (store) => _DistanceFieldViewModel(
              distance: store.state.distance,
              unit: mapMetricStoreStateToString(store.state.metricUnitsEnabled),
              onChange: (newState) => store.dispatch(DistanceUpdateAction(
                  distance: newState,
                  shouldCalcPace: widget.shouldUpdatePace,
                  shouldCalcTime: widget.shouldUpdateTime)),
            ),
        builder: (BuildContext context, _DistanceFieldViewModel viewModel) {
          return Padding(
              padding: const EdgeInsets.only(top: 12),
              child: TextField(
                onChanged: viewModel.onChange,
                decoration: InputDecoration(
                  hintText: 'Distance in ${viewModel.unit}',
                  labelText: 'Distance',
                ),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                controller: widget.controller,
              ));
        });
  }
}

class _DistanceFieldViewModel {
  // final AppState state;
  final String distance;
  final String unit;
  final void Function(String newState) onChange;

  _DistanceFieldViewModel(
      {required this.distance, required this.unit, required this.onChange});
}
