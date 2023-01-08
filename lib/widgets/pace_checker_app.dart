import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'home_page.dart';

class PaceCheckerApp extends StatelessWidget {
  final Store<bool> metricSettingStore;
  const PaceCheckerApp({super.key, required this.metricSettingStore});

  @override
  Widget build(BuildContext context) {
    return StoreProvider<bool>(
        store: metricSettingStore,
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
