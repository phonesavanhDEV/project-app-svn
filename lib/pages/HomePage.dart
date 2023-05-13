import 'package:flutter/material.dart';
import 'package:svn_costing_profit/contact/HaxColors.dart';

import 'navigation/dashboard.dart';
import 'navigation/notifications.dart';
import 'navigation/setting.dart';
import 'widgets/CustomAppBarHeader.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    Dashboard(),
    Notifications(),
    Settings(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarHeader(
        title: 'SouvannyCosting',
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        selectedItemColor: HaxColor.colorDarkGreen,
        unselectedItemColor: Colors.white,
        backgroundColor: HaxColor.colorOrange,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'ຫຼັກໜ້າ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'ການຕັ່ງຄ່າ',
          ),
        ],
      ),
    );
  }
}
