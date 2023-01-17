import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:pace_tracker_app/redux/settings_actions.dart';

import '../../redux/app_state.dart';

class DarkModeSwitch extends StatefulWidget {
  const DarkModeSwitch({super.key});

  @override
  State<StatefulWidget> createState() => _DarkModeSwitchState();
}

class _DarkModeSwitchState extends State<DarkModeSwitch> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _DarkModeSwitchViewModel>(
      converter: (store) => _DarkModeSwitchViewModel(
        darkModeEnabled: store.state.darkModeEnabled,
        onChange: ((newState) => store.dispatch(DarkModeSettingUpdateAction())),
      ),
      builder: (BuildContext context, _DarkModeSwitchViewModel viewModel) {
        return SwitchListTile(
            title: const Text('Dark Mode'),
            value: viewModel.darkModeEnabled,
            secondary: const Icon(Icons.dark_mode),
            onChanged: viewModel.onChange);
      },
    );
  }
}

class _DarkModeSwitchViewModel {
  final bool darkModeEnabled;
  final void Function(bool newState) onChange;

  _DarkModeSwitchViewModel(
      {required this.darkModeEnabled, required this.onChange});
}
