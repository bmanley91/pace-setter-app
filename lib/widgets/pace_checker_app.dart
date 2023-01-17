import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../redux/app_state.dart';
import 'pages/home_page.dart';

class PaceCheckerApp extends StatelessWidget {
  const PaceCheckerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _PaceCheckerAppViewModel>(
      builder: (BuildContext context, _PaceCheckerAppViewModel viewModel) =>
          MaterialApp(
        title: 'Pace Checker',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: viewModel.darkModeEnabled ? ThemeMode.dark : ThemeMode.light,
        home: const HomePage(),
      ),
      converter: (store) => _PaceCheckerAppViewModel(
          darkModeEnabled: store.state.darkModeEnabled),
    );
  }
}

class _PaceCheckerAppViewModel {
  bool darkModeEnabled;

  _PaceCheckerAppViewModel({required this.darkModeEnabled});
}
