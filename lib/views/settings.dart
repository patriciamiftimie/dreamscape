import 'package:dreamscape/views/privacy_policy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

import '../auth/auth.dart';
import '../constants/colours.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key, required this.title, required this.uid});

  final String title;
  final String uid;

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Future<void> _showEditNameDialog() async {
    TextEditingController nameController = TextEditingController();

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Name'),
          content: TextField(
            controller: nameController,
            decoration: const InputDecoration(
                hintText: 'What would you like to be called?'),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
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
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'User Profile',
                style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              ListTile(
                title: Text(
                  'Name',
                  style: TextStyle(color: Colors.grey[800], fontSize: 18),
                ),
                subtitle: Text(
                  "Patricia",
                  style: TextStyle(color: Colors.grey[800], fontSize: 16),
                ),
                trailing: IconButton(
                  icon: Icon(
                    Icons.edit,
                    size: 30,
                    color: Colors.grey[700],
                  ),
                  onPressed: () {
                    _showEditNameDialog();
                  },
                ),
              ),
              const Divider(),
              Text(
                'Notification Settings',
                style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              ListTile(
                selectedColor: customYellow,
                title: Text(
                  'Push Notifications',
                  style: TextStyle(color: Colors.grey[800], fontSize: 18),
                ),
                trailing: Switch(
                  trackColor: trackColor,
                  value: false, //TODO implement push notifications
                  onChanged: (value) {
                    // Handle the toggle event
                  },
                ),
              ),
              const Divider(),
              Text(
                'Need more support?',
                style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              ListTile(
                subtitle: Linkify(
                  onOpen: (link) async {
                    if (await canLaunchUrl(Uri.parse(link.url))) {
                      await launchUrl(Uri.parse(link.url));
                    } else {
                      throw 'Could not launch $link';
                    }
                  },
                  text:
                      "CBT Techniques: https://www.nhs.uk/every-mind-matters/mental-wellbeing-tips/self-help-cbt-techniques/"
                      "\n\nMindfulness: https://www.nhs.uk/mental-health/self-help/tips-and-support/mindfulness/",
                  style: TextStyle(color: Colors.grey[800], fontSize: 16),
                  linkStyle: TextStyle(color: customAzure),
                ),
              ),
              const Divider(),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PrivacyPolicyPage()),
                      );
                    },
                    child: Text(
                      "Privacy policy",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: customPurple,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      signOutUser();
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: customPurple,
                        foregroundColor: Colors.white,
                        minimumSize: const Size(120, 55)),
                    child: const Text(
                      'Log out',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  final MaterialStateProperty<Color?> trackColor =
      MaterialStateProperty.resolveWith<Color?>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return customYellow;
      }
      return customWhite;
    },
  );
}
