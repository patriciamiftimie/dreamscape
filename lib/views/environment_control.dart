import 'package:flutter/material.dart';

class EnvironmentScreen extends StatefulWidget {
  const EnvironmentScreen({super.key, required this.title, required this.uid});

  final String title;
  final String uid;

  @override
  State<EnvironmentScreen> createState() => _EnvironmentScreenState();
}

class _EnvironmentScreenState extends State<EnvironmentScreen> {
  double _temperature = 20.0;
  double _lightIntensity = 50.0;
  double _humidity = 40.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Column(
                  children: <Widget>[
                    ListTile(
                      title: Text('Manual Controls'),
                      subtitle: Text('Adjust your environment settings'),
                    ),
                    Slider(
                      value: _temperature,
                      min: 0,
                      max: 40,
                      divisions: 80,
                      label: '${_temperature.toStringAsFixed(1)} °C',
                      onChanged: (double value) {
                        setState(() {
                          _temperature = value;
                        });
                      },
                    ),
                    Slider(
                      value: _lightIntensity,
                      min: 0,
                      max: 100,
                      divisions: 100,
                      label: '${_lightIntensity.toStringAsFixed(1)}%',
                      onChanged: (double value) {
                        setState(() {
                          _lightIntensity = value;
                        });
                      },
                    ),
                    Slider(
                      value: _humidity,
                      min: 0,
                      max: 100,
                      divisions: 100,
                      label: '${_humidity.toStringAsFixed(1)}%',
                      onChanged: (double value) {
                        setState(() {
                          _humidity = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Schedules'),
                subtitle: Text('Set up and manage automatic adjustments'),
                onTap: () {
                  // Navigation to schedule management page
                },
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Scenes'),
                subtitle: Text('Select or create scenes'),
                onTap: () {
                  // Navigation to scenes management page
                },
              ),
            ),
            Card(
              child: ExpansionTile(
                title: Text('Aromatherapy Control'),
                children: <Widget>[
                  DropdownButton<String>(
                    value: null,
                    hint: Text('Select Oil'),
                    onChanged: (String? newValue) {
                      // Update the selected oil
                    },
                    items: <String>[
                      'Lavender',
                      'Eucalyptus',
                      'Peppermint',
                      'Rosemary'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  Slider(
                    value: 30.0,
                    min: 0,
                    max: 100,
                    divisions: 100,
                    label: '30%',
                    onChanged: (double value) {
                      // Update the intensity
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
