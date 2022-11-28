import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CalculatorField extends StatefulWidget {
  final String value;
  final String hint;
  final String label;
  final ValueChanged<String> onChanged;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final List<TextInputFormatter> inputMasks;

  const CalculatorField(
      {super.key,
      required this.value,
      required this.onChanged,
      required this.hint,
      required this.label,
      required this.controller,
      this.keyboardType = TextInputType.text,
      this.inputMasks = const []});

  @override
  State<StatefulWidget> createState() => _CalculatorFieldState();
}

class _CalculatorFieldState extends State<CalculatorField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 12),
        child: TextField(
          decoration: InputDecoration(
            hintText: widget.hint,
            labelText: widget.label,
          ),
          onChanged: widget.onChanged,
          keyboardType: widget.keyboardType,
          inputFormatters: widget.inputMasks,
        ));
  }

  @override
  void dispose() {
    super.dispose();
    widget.controller.dispose();
  }
}
