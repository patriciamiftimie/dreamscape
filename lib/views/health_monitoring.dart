import 'package:dreamscape/constants/colours.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HealthScreen extends StatefulWidget {
  const HealthScreen({super.key, required this.title, required this.uid});

  final String title;
  final String uid;

  @override
  State<HealthScreen> createState() => _HealthScreenState();
}

class _HealthScreenState extends State<HealthScreen> {
  late List<HealthData> heartRateData;
  late List<HealthData> temperatureData;

  @override
  void initState() {
    super.initState();
    heartRateData = getHeartRateData();
    temperatureData = getTemperatureData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SfCartesianChart(
              title: ChartTitle(
                  text: 'Heart Rate Trends',
                  textStyle: TextStyle(
                      color: customPurple,
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
              legend: const Legend(isVisible: true),
              primaryXAxis: const CategoryAxis(),
              tooltipBehavior: TooltipBehavior(enable: true),
              series: <LineSeries<HealthData, String>>[
                LineSeries<HealthData, String>(
                  dataSource: heartRateData,
                  xValueMapper: (HealthData data, _) => data.time,
                  yValueMapper: (HealthData data, _) => data.value,
                  name: 'Heart Rate',
                  markerSettings: const MarkerSettings(isVisible: true),
                )
              ],
            ),
            SfCartesianChart(
              title: ChartTitle(
                  text: 'Skin Temperature Trends',
                  textStyle: TextStyle(
                      color: customPurple,
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
              legend: const Legend(isVisible: true),
              primaryXAxis: const CategoryAxis(),
              tooltipBehavior: TooltipBehavior(enable: true),
              series: <LineSeries<HealthData, String>>[
                LineSeries<HealthData, String>(
                  dataSource: temperatureData,
                  xValueMapper: (HealthData data, _) => data.time,
                  yValueMapper: (HealthData data, _) => data.value,
                  name: 'Temperature',
                  markerSettings: const MarkerSettings(isVisible: true),
                )
              ],
            ),
            Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Card(
                      color: customYellow,
                      elevation: 2,
                      margin: const EdgeInsets.all(8),
                      child: ListTile(
                        leading: Icon(Icons.bedtime, color: customLilac),
                        title: Text(
                          'Sleep Analysis',
                          style: TextStyle(
                              color: customPurple, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          'Detailed breakdown of sleep stages and quality.',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.onSurface),
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.analytics, color: customPurple),
                          onPressed:
                              () {}, // Placeholder for future functionality
                        ),
                      ),
                    ),
                    Card(
                      color: customYellow,
                      elevation: 2,
                      margin: const EdgeInsets.all(8),
                      child: ListTile(
                        leading: Icon(Icons.auto_awesome, color: customLilac),
                        title: Text(
                          'Recommendations',
                          style: TextStyle(
                              color: customPurple, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          'Personalised tips based on your health data, powered by AI.',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.onSurface),
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.lightbulb, color: customPurple),
                          onPressed:
                              () {}, // Placeholder for future functionality
                        ),
                      ),
                    ),
                  ],
                )),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: customPurple,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(120, 45)),
              onPressed: () {},
              child: const Text(
                'Sync with Health Apps',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<HealthData> getHeartRateData() {
    return [
      HealthData('12:00 AM', 70),
      HealthData('1:00 AM', 72),
      HealthData('2:00 AM', 68),
      HealthData('3:00 AM', 65),
      HealthData('4:00 AM', 70),
      HealthData('5:00 AM', 71),
      HealthData('6:00 AM', 74),
      HealthData('7:00 AM', 78),
      HealthData('8:00 AM', 75),
      HealthData('9:00 AM', 73),
      HealthData('10:00 AM', 76),
      HealthData('11:00 AM', 79),
      HealthData('12:00 PM', 80),
      HealthData('1:00 PM', 82),
      HealthData('2:00 PM', 81),
      HealthData('3:00 PM', 84),
      HealthData('4:00 PM', 86),
      HealthData('5:00 PM', 85),
      HealthData('6:00 PM', 83),
      HealthData('7:00 PM', 80),
      HealthData('8:00 PM', 79),
      HealthData('9:00 PM', 78),
      HealthData('10:00 PM', 76),
      HealthData('11:00 PM', 74),
    ];
  }

  List<HealthData> getTemperatureData() {
    return [
      HealthData('12:00 AM', 36.5),
      HealthData('1:00 AM', 36.7),
      HealthData('2:00 AM', 36.4),
      HealthData('3:00 AM', 36.2),
      HealthData('4:00 AM', 36.1),
      HealthData('5:00 AM', 36.3),
      HealthData('6:00 AM', 36.6),
      HealthData('7:00 AM', 36.8),
      HealthData('8:00 AM', 37.0),
      HealthData('9:00 AM', 37.2),
      HealthData('10:00 AM', 37.1),
      HealthData('11:00 AM', 37.3),
      HealthData('12:00 PM', 37.5),
      HealthData('1:00 PM', 37.4),
      HealthData('2:00 PM', 37.2),
      HealthData('3:00 PM', 37.0),
      HealthData('4:00 PM', 36.9),
      HealthData('5:00 PM', 36.7),
      HealthData('6:00 PM', 36.5),
      HealthData('7:00 PM', 36.4),
      HealthData('8:00 PM', 36.6),
      HealthData('9:00 PM', 36.7),
      HealthData('10:00 PM', 36.5),
      HealthData('11:00 PM', 36.3),
    ];
  }
}

class HealthData {
  HealthData(this.time, this.value);

  final String time;
  final double value;
}
