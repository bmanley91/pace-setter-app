import 'package:flutter/material.dart';

class Shill extends StatelessWidget {
  final Future<bool> Function(String target) urlLauncher;
  final String url;
  const Shill({super.key, required this.url, required this.urlLauncher});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: const Text('Do you enjoy this app?'),
        onTap: () => _launchLink(url),
        subtitle: const Text('Tap here to buy me a coffee!'));
  }

  _launchLink(url) async {
    try {
      await urlLauncher(url);
      debugPrint('Successfully launched $url');
    } catch (err) {
      throw 'Could not launch $url. $err';
    }
  }
}
