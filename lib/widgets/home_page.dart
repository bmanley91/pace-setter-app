import 'package:flutter/material.dart';
import 'package:pace_tracker_app/widgets/calculator.dart';
import 'package:pace_tracker_app/widgets/description.dart';

import 'preset_selector.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Pace Checker'),
        ),
        body: Center(
            child: Padding(
                padding: const EdgeInsets.all(32),
                child: ListView(children: const <Widget>[
                  Description(),
                  PresetSelector(),
                  Calculator()
                ]))));
  }
}
