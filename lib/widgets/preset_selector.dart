import 'package:flutter/material.dart';

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class PresetSelector extends StatefulWidget {
  const PresetSelector({super.key});

  @override
  State<StatefulWidget> createState() => _PresetSelectorState();
}

class _PresetSelectorState extends State<PresetSelector> {
  String? _dropdownValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        hint: const Text('Select a preset'),
        value: _dropdownValue,
        items: list.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (var value) {
          // This is called when the user selects an item.
          setState(() {
            _dropdownValue = value!;
          });
        });
  }
}
