import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:pace_tracker_app/redux/form_update_actions.dart';

import 'package:pace_tracker_app/redux/app_state.dart';

class ClearButton extends StatelessWidget {
  final List<TextEditingController> controllersToClear;

  const ClearButton({super.key, required this.controllersToClear});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ClearButtonViewModel>(
      builder: (BuildContext context, _ClearButtonViewModel viewModel) {
        return Padding(
            padding: const EdgeInsets.only(top: 32),
            child: ElevatedButton(
              onPressed: viewModel.handlePress,
              child: const Text('Clear'),
            ));
      },
      converter: (store) => _ClearButtonViewModel(
        state: store.state,
        handlePress: () {
          debugPrint('Clear button pressed');
          store.dispatch(FormClearAction());
          for (var controller in controllersToClear) {
            debugPrint('Clearing controller $controller');
            controller.clear();
          }
        },
      ),
    );
  }
}

class _ClearButtonViewModel {
  final AppState state;
  final void Function() handlePress;

  _ClearButtonViewModel({required this.state, required this.handlePress});
}
