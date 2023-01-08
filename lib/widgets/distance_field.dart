import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class DistanceField extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final TextEditingController controller;

  const DistanceField(
      {super.key, required this.onChanged, required this.controller});

  @override
  State<StatefulWidget> createState() => _DistanceFieldState();
}

class _DistanceFieldState extends State<DistanceField> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<bool, String>(
        converter: (store) => _mapStoreStateToString(store.state),
        builder: (context, unit) {
          return Padding(
              padding: const EdgeInsets.only(top: 12),
              child: TextField(
                onChanged: widget.onChanged,
                decoration: InputDecoration(
                  hintText: 'Distance in $unit',
                  labelText: 'Distance',
                ),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                controller: widget.controller,
              ));
        });
  }

  String _mapStoreStateToString(bool storeState) {
    debugPrint('Mapping store state $storeState');
    return storeState ? 'kilometers' : 'miles';
  }
}
