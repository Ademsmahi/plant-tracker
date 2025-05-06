import 'package:flutter/material.dart';
import '../bottomnavbar.dart';
import 'home_content_page.dart';
import '../stats_page.dart';
import '../profile_page.dart';
import '../documentation_page.dart';
import '../disease_detection.dart';

class ManagerHomePage extends StatefulWidget {
  final String? greenhouseName;
  const ManagerHomePage({this.greenhouseName});

  @override
  State<ManagerHomePage> createState() => _ManagerHomePageState();
}

class _ManagerHomePageState extends State<ManagerHomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeContentPage(),
    DiseaseDetectionPage(),
    StatsPage(),
    ProfilePage(),
    ReportPage(),
  ];
  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
