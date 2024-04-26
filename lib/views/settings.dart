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
  bool pushNotificationsEnabled = false;
  double optimalTemperature = 18.3;
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            ListTile(
              title: const Text('Optimal Temperature (°C)'),
              subtitle: Text('$optimalTemperature °C'),
              leading: const Icon(Icons.device_thermostat_rounded),
              trailing: IconButton(
                icon: const Icon(Icons.edit),
                onPressed: _showEditTemperatureDialog,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.color_lens),
              title: const Text('Theme'),
              subtitle: const Text('Serene (Default)'),
              onTap: () {},
              trailing: IconButton(
                icon: const Icon(Icons.edit),
                onPressed: _showEditTemperatureDialog,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.language),
              title: const Text('Language'),
              subtitle: const Text('English'),
              onTap: () {},
              trailing: IconButton(
                icon: const Icon(Icons.edit),
                onPressed: _showEditTemperatureDialog,
              ),
            ),
            SwitchListTile(
              activeColor: customAzure,
              title: const Text('Push Notifications'),
              value: pushNotificationsEnabled,
              onChanged: (bool value) {
                setState(() {
                  pushNotificationsEnabled = value;
                });
              },
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Linkify(
                onOpen: (link) async {
                  if (await canLaunchUrl(Uri.parse(link.url))) {
                    await launchUrl(Uri.parse(link.url));
                  } else {
                    throw 'Could not launch $link';
                  }
                },
                text:
                    "Need more support? Visit online resources.\n\nSleep hygiene: https://www.nhs.uk/every-mind-matters/mental-wellbeing-tips/how-to-fall-asleep-faster-and-sleep-better/\n\nBedtime meditation: https://www.nhs.uk/live-well/sleep-and-tiredness/bedtime-meditation/",
                style: const TextStyle(fontSize: 16),
                linkStyle: TextStyle(color: customLilac),
              ),
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
              child: Text(
                "View Privacy Policy",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: customLilac),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: customPurple,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(120, 45)),
              onPressed: () {
                signOutUser();
              },
              child: const Text(
                'Log out',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
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
