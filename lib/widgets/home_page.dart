import 'package:flutter/material.dart';
import 'package:pace_tracker_app/widgets/pace_calculator.dart';
import 'package:pace_tracker_app/widgets/time_calculator.dart';

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
        body: Center(
            child: Padding(
                padding: const EdgeInsets.all(32),
                child: _calculators.elementAt(_selectedNavIndex))),
        bottomNavigationBar: BottomNavigationBar(
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
          currentIndex: _selectedNavIndex,
          selectedItemColor: Colors.blue[500],
          onTap: _onNavTapped,
        ));
  }
}
