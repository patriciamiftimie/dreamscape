import 'package:dreamscape/constants/colours.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 16.0),
              child: Card(
                color: customYellow,
                child: Column(
                  children: <Widget>[
                    ListTile(
                      title: Text('Manual Controls',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: customPurple)),
                      subtitle: const Text(
                        'Adjust your environment settings',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 6),
                            child: Text(
                              'Temperature',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: customPurple,
                              ),
                            ),
                          ),
                          Slider(
                            activeColor: customLilac,
                            inactiveColor: Colors.white,
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
                          Padding(
                            padding: const EdgeInsets.only(top: 6),
                            child: Text(
                              'Light Intensity',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: customPurple,
                              ),
                            ),
                          ),
                          Slider(
                            activeColor: customLilac,
                            inactiveColor: Colors.white,
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
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 16.0),
              child: Card(
                color: customYellow,
                elevation: 1,
                shadowColor: Theme.of(context).shadowColor.withOpacity(0.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.calendar_today, color: customPurple),
                      title: Text(
                        'Schedules',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: customPurple),
                      ),
                      subtitle: const Text(
                          'Manage automatic adjustments - Connect to Google/Outlook calendar.',
                          style: TextStyle(fontSize: 16)),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text(
                              'Schedule Management',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            content: Container(
                              width: double.maxFinite,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Text(
                                      'Integrate and manage your schedules here.'),
                                  const SizedBox(height: 10),
                                  ConstrainedBox(
                                    constraints: const BoxConstraints(
                                      maxHeight: 400,
                                    ),
                                    child: TableCalendar(
                                      firstDay: DateTime.utc(2010, 10, 16),
                                      lastDay: DateTime.utc(2030, 3, 16),
                                      focusedDay: DateTime.now(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('Close'),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    const Divider(
                      color: Colors.white,
                      thickness: 2,
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.lightbulb_outline,
                        color: customPurple,
                        size: 30,
                      ),
                      title: Text(
                        'Scenes',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: customPurple),
                      ),
                      subtitle: const Text(
                          'Select or create scenes to automate your environment',
                          style: TextStyle(fontSize: 16)),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Scene Selection'),
                            content: const Text(
                                'Choose from existing scenes or create new ones to customize your environment.'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('Close'),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 16.0),
              child: Card(
                color: customYellow,
                child: ExpansionTile(
                  title: Text(
                    'Aromatherapy Control',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: customPurple),
                  ),
                  children: <Widget>[
                    DropdownButton<String>(
                      value: null,
                      hint: const Text('Select Oil'),
                      onChanged: (String? newValue) {},
                      items: <String>[
                        'Lavender',
                        'Eucalyptus',
                        'Sandalwood',
                        'Bergamot'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    Slider(
                      activeColor: customLilac,
                      inactiveColor: Colors.white,
                      value: 20.0,
                      min: 0,
                      max: 100,
                      divisions: 100,
                      label: '20%',
                      onChanged: (double value) {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
