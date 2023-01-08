import 'package:flutter/material.dart';
import 'package:pace_tracker_app/widgets/unit_switcher.dart';

class SettingsDrawer extends StatefulWidget {
  const SettingsDrawer({super.key});

  @override
  State<SettingsDrawer> createState() => _SettingsDrawerState();
}

class _SettingsDrawerState extends State<SettingsDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: const [UnitSwitcher()],
      ),
    );
  }
}
