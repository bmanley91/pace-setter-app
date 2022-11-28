import 'package:flutter/material.dart';

class ClearButton extends StatelessWidget {
  final void Function() clearFunction;

  const ClearButton({super.key, required this.clearFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 32),
        child: ElevatedButton(
          onPressed: () => clearFunction(),
          child: const Text('Clear'),
        ));
  }
}
