import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

import '../auth/auth.dart';
import '../constants/colours.dart';
import '../views/privacy_policy.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key, required this.title, required this.uid});

  final String title;
  final String uid;

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool pushNotificationsEnabled = false; // Example state for push notifications
  double optimalTemperature = 18.3; // Default optimal temperature
  final TextEditingController tempController = TextEditingController();

  @override
  void initState() {
    super.initState();
    tempController.text = optimalTemperature.toString();
  }

  Future<void> _showEditTemperatureDialog() async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Set Optimal Temperature'),
          content: TextField(
            controller: tempController,
            keyboardType: TextInputType.number,
            decoration:
                const InputDecoration(hintText: 'Enter temperature in °C'),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  optimalTemperature = double.tryParse(tempController.text) ??
                      optimalTemperature;
                  Navigator.pop(context);
                });
              },
              child: const Text('Save'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            ListTile(
              title: const Text('Optimal Temperature (°C)'),
              subtitle: Text('$optimalTemperature °C'),
              trailing: IconButton(
                icon: const Icon(Icons.edit),
                onPressed: _showEditTemperatureDialog,
              ),
            ),
            SwitchListTile(
              title: const Text('Push Notifications'),
              value: pushNotificationsEnabled,
              onChanged: (bool value) {
                setState(() {
                  pushNotificationsEnabled = value;
                });
              },
            ),
            const Divider(),
            Linkify(
              onOpen: (link) async {
                if (await canLaunchUrl(Uri.parse(link.url))) {
                  await launchUrl(Uri.parse(link.url));
                } else {
                  throw 'Could not launch $link';
                }
              },
              text:
                  "Visit helpful mental health resources online.\n\nMindfulness: https://www.nhs.uk/mental-health/self-help/tips-and-support/mindfulness/",
              style: const TextStyle(fontSize: 16),
              linkStyle:
                  TextStyle(color: Theme.of(context).colorScheme.secondary),
            ),
            const Divider(),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PrivacyPolicyPage()),
                );
              },
              child: const Text("View Privacy Policy"),
            ),
            ElevatedButton(
              onPressed: () {
                signOutUser();
              },
              child: const Text('Log out'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    tempController.dispose();
    super.dispose();
  }
}
