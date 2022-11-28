import 'package:flutter/material.dart';

class CalculatorField extends StatefulWidget {
  final String value;
  final String hint;
  final String label;
  final ValueChanged<String> onChanged;

  const CalculatorField({
    super.key,
    required this.value,
    required this.onChanged,
    required this.hint,
    required this.label,
  });

  @override
  State<StatefulWidget> createState() => _CalculatorFieldState();
}

class _CalculatorFieldState extends State<CalculatorField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 12),
        child: TextField(
          onChanged: widget.onChanged,
          decoration: InputDecoration(
            hintText: widget.hint,
            labelText: widget.label,
          ),
        ));
  }
}
