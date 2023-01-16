import 'package:flutter/material.dart';
import 'package:pace_tracker_app/util/constants.dart';
import 'package:pace_tracker_app/widgets/settings/shill.dart';
import 'package:pace_tracker_app/widgets/settings/unit_switcher.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsDrawer extends StatefulWidget {
  const SettingsDrawer({super.key});

  @override
  State<SettingsDrawer> createState() => _SettingsDrawerState();
}

class _SettingsDrawerState extends State<SettingsDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: const [
          SafeArea(child: UnitSwitcher()),
          Spacer(),
          SafeArea(child: Shill(urlLauncher: launch, url: kofiUrl))
        ],
      ),
    );
  }
}
