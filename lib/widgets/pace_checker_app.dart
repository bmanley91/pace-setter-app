import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:pace_tracker_app/redux/app_state.dart';
import 'package:redux/redux.dart';

import 'home_page.dart';

class PaceCheckerApp extends StatelessWidget {
  final Store<AppState> appStore;
  const PaceCheckerApp({super.key, required this.appStore});

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
        store: appStore,
        child: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: MaterialApp(
              title: 'Pace Checker',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: const HomePage(),
            )));
  }
}
