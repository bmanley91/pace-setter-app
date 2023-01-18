import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:pace_tracker_app/redux/app_state.dart';
import 'package:pace_tracker_app/redux/form_update_actions.dart';

class NavBar extends StatelessWidget {
  final void Function(int) onTap;
  final int currentIndex;

  const NavBar({super.key, required this.onTap, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _NavBarViewModel>(
      builder: (BuildContext context, _NavBarViewModel viewModel) =>
          BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.fast_forward),
            label: 'Pace',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.schedule),
            label: 'Time',
          ),
        ],
        currentIndex: currentIndex,
        selectedItemColor: Colors.blue[500],
        onTap: viewModel.onTapFunction,
      ),
      converter: (store) => _NavBarViewModel(onTapFunction: (value) {
        debugPrint('123');
        store.dispatch(FormClearAction());
        onTap(value);
      }),
    );
  }
}

class _NavBarViewModel {
  final void Function(int) onTapFunction;

  _NavBarViewModel({required this.onTapFunction});
}
