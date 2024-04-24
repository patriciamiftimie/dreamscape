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
              title: ChartTitle(text: 'Heart Rate Trends'),
              legend: Legend(isVisible: true),
              primaryXAxis: CategoryAxis(),
              tooltipBehavior: TooltipBehavior(enable: true),
              series: <LineSeries<HealthData, String>>[
                LineSeries<HealthData, String>(
                  dataSource: heartRateData,
                  xValueMapper: (HealthData data, _) => data.time,
                  yValueMapper: (HealthData data, _) => data.value,
                  name: 'Heart Rate',
                  markerSettings: MarkerSettings(isVisible: true),
                )
              ],
            ),
            SfCartesianChart(
              title: ChartTitle(text: 'Skin Temperature Trends'),
              legend: Legend(isVisible: true),
              primaryXAxis: CategoryAxis(),
              tooltipBehavior: TooltipBehavior(enable: true),
              series: <LineSeries<HealthData, String>>[
                LineSeries<HealthData, String>(
                  dataSource: temperatureData,
                  xValueMapper: (HealthData data, _) => data.time,
                  yValueMapper: (HealthData data, _) => data.value,
                  name: 'Temperature',
                  markerSettings: MarkerSettings(isVisible: true),
                )
              ],
            ),
            Card(
              child: ListTile(
                title: Text('Sleep Analysis'),
                subtitle:
                    Text('Detailed breakdown of sleep stages and quality.'),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Recommendations'),
                subtitle: Text('Personalized tips based on your health data.'),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Sync with Health Apps'),
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
    ];
  }

  List<HealthData> getTemperatureData() {
    return [
      HealthData('12:00 AM', 36.5),
      HealthData('1:00 AM', 36.7),
      HealthData('2:00 AM', 36.4),
    ];
  }
}

class HealthData {
  HealthData(this.time, this.value);

  final String time;
  final double value;
}
