import 'package:flutter/material.dart';

class DistanceField extends StatefulWidget {
  final ValueChanged<String> onChanged;

  const DistanceField({
    super.key,
    required this.onChanged,
  });

  @override
  State<StatefulWidget> createState() => _DistanceFieldState();
}

class _DistanceFieldState extends State<DistanceField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 12),
        child: TextField(
          onChanged: widget.onChanged,
          decoration: const InputDecoration(
            hintText: 'Distance in miles',
            labelText: 'Distance',
          ),
          keyboardType: TextInputType.number,
        ));
  }
}
