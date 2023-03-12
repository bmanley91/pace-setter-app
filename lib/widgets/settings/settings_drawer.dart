import 'package:flutter/material.dart';
import 'package:pace_tracker_app/util/analytics.dart';
import 'package:pace_tracker_app/util/constants.dart';
import 'package:pace_tracker_app/widgets/settings/dark_mode_switch.dart';
import 'package:pace_tracker_app/widgets/settings/shill.dart';
import 'package:pace_tracker_app/widgets/settings/unit_switcher.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsDrawer extends StatefulWidget {
  const SettingsDrawer({super.key, required this.analyticsClient});

  final AnalyticsClient analyticsClient;

  @override
  State<SettingsDrawer> createState() => _SettingsDrawerState();
}

class _SettingsDrawerState extends State<SettingsDrawer> {
  @override
  Widget build(BuildContext context) {
    widget.analyticsClient.logSettingsOpened();
    return Drawer(
      child: Column(
        children: const [
          SafeArea(child: UnitSwitcher()),
          DarkModeSwitch(),
          Spacer(),
          SafeArea(child: Shill(urlLauncher: launch, url: kofiUrl))
        ],
      ),
    );
  }
}
