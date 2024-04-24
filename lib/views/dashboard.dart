import 'package:dreamscape/constants/colours.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key, required this.title, required this.uid});

  final String title;
  final String uid;

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Card(
                color: customYellow,
                child: Column(
                  children: <Widget>[
                    ListTile(
                      //leading: Icon(Icons.timer, color: customPurple, size: 30),
                      title: Text('Real-Time Overview',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: customPurple)),
                      subtitle: const Text(
                        'Current environmental conditions',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.thermostat_outlined,
                        color: customPurple,
                      ),
                      title: const Text('Temperature'),
                      subtitle: const Text('22°C'),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.water_drop,
                        color: customPurple,
                      ),
                      title: Text('Humidity'),
                      subtitle: Text('45%'),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.wb_sunny,
                        color: customPurple,
                      ),
                      title: Text('Light Level'),
                      subtitle: Text('Moderate'),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.spa,
                        color: customPurple,
                      ),
                      title: Text('Aromatherapy Diffuser'),
                      subtitle: Text('On - Sandalwood'),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: customPurple,
                        foregroundColor: Colors.white,
                        minimumSize: const Size(120, 45)),
                    onPressed: () {},
                    child: const Text('Sleep Mode Off',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: customPurple,
                        foregroundColor: Colors.white,
                        minimumSize: const Size(120, 45)),
                    onPressed: () {},
                    child: const Text(
                      'Manage Devices',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Card(
                color: customYellow,
                elevation: 1,
                shadowColor: Theme.of(context).shadowColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  leading:
                      Icon(Icons.nights_stay, color: customLilac, size: 30),
                  title: Text(
                    'Sleep Quality Snapshot',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: customPurple,
                    ),
                  ),
                  subtitle: const Text(
                    'Last night: 7.5 hours - Good',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.info_outline,
                      color: customLilac,
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text("Sleep Quality Details"),
                            content: const Text(
                                "Detailed metrics and analysis of last night's sleep quality."),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: const Text("Close"),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
