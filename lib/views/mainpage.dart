import 'package:flutter/material.dart';
import 'package:dreamscape/views/dashboard.dart';
import 'package:dreamscape/views/environment_control.dart';
import 'package:dreamscape/views/settings.dart';
import 'package:dreamscape/views/health_monitoring.dart';
import '../constants/colours.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.title, required this.uid});

  final String title;
  final String uid;
  @override
  State<MainPage> createState() => _MainPageState();
}

//home screen state
class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      DashboardScreen(title: 'Dashboard', uid: widget.uid),
      EnvironmentScreen(title: "Environment", uid: widget.uid),
      HealthScreen(title: "Health", uid: widget.uid),
      SettingsScreen(title: "Settings", uid: widget.uid),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'DreamScape',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        backgroundColor: customLilac,
        foregroundColor: customWhite,
        toolbarHeight: MediaQuery.of(context).size.height / 7,
        leading: Container(),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.elliptical(1290, 250),
          ),
        ),
      ),
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded), label: 'Dashboard'),
          BottomNavigationBarItem(
              icon: Icon(Icons.thermostat), label: 'Controls'),
          BottomNavigationBarItem(
              icon: Icon(Icons.bedtime_rounded), label: 'Health'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings_rounded), label: 'Settings'),
        ],
        iconSize: 30,
        selectedFontSize: 15,
        selectedItemColor: customPurple,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
