import 'package:flutter/material.dart';
import 'package:pace_tracker_app/widgets/nav/nav_bar.dart';
import 'package:pace_tracker_app/widgets/pages/pace_calculator.dart';
import 'package:pace_tracker_app/widgets/settings/settings_drawer.dart';
import 'package:pace_tracker_app/widgets/pages/time_calculator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedNavIndex = 0;

  void _onNavTapped(int index) {
    setState(() {
      _selectedNavIndex = index;
    });
  }

  final _calculators = const <Widget>[PaceCalculator(), TimeCalculator()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Pace Checker'),
        ),
        endDrawer: const SettingsDrawer(),
        body: Center(
            child: Padding(
                padding: const EdgeInsets.all(32),
                child: _calculators.elementAt(_selectedNavIndex))),
        bottomNavigationBar: NavBar(
          onTap: _onNavTapped,
          currentIndex: _selectedNavIndex,
        ));
  }
}
