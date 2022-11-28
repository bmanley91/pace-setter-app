import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  const Description({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
        padding: EdgeInsets.only(bottom: 12),
        child: Text(
          'Enter race info to calculate time and pace or select a preset',
          style: TextStyle(
            fontSize: 24,
          ),
          textAlign: TextAlign.center,
        ));
  }
}
