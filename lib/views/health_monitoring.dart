import 'package:flutter/material.dart';

class HealthScreen extends StatefulWidget {
  const HealthScreen({super.key, required this.title, required this.uid});

  final String title;
  final String uid;

  @override
  State<HealthScreen> createState() => _HealthScreenState();
}

class _HealthScreenState extends State<HealthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Health'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Card(
                child: Column(
                  children: <Widget>[
                    ListTile(
                      title: Text('Real-time Overview'),
                      subtitle: Text('Current environmental conditions'),
                    ),
                    ListTile(
                      leading: Icon(Icons.thermostat_outlined),
                      title: Text('Temperature'),
                      subtitle: Text('22°C'),
                    ),
                    ListTile(
                      leading: Icon(Icons.water_drop),
                      title: Text('Humidity'),
                      subtitle: Text('45%'),
                    ),
                    ListTile(
                      leading: Icon(Icons.wb_sunny),
                      title: Text('Light Level'),
                      subtitle: Text('Moderate'),
                    ),
                    ListTile(
                      leading: Icon(Icons.spa),
                      title: Text('Aromatherapy Diffuser'),
                      subtitle: Text('On'),
                    ),
                  ],
                ),
              ),
            ),
            const Card(
              child: ListTile(
                title: Text('Sleep Quality Snapshot'),
                subtitle: Text('Last night: 7.5 hours - Good'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      // Add functionality for "Turn off all devices"
                    },
                    child: const Text('Turn Off All Devices'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Add functionality for "Good Night Mode"
                    },
                    child: const Text('Good Night Mode'),
                  ),
                ],
              ),
            ),
            const Card(
              child: ListTile(
                title: Text('Notifications / Alerts'),
                subtitle:
                    Text('Consider lowering the room temperature tonight.'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
