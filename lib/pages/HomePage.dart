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
      bottomNavigationBar: Theme(
        data: ThemeData(
          textTheme: TextTheme(
            bodyText2: TextStyle(
              fontFamily: 'NotoSansLao',
              fontSize: 10.0,
              color: Colors.white,
            ),
          ),
        ),
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'ຫຼັກໜ້າ',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'ການຕັ່ງຄ່າ',
            ),
          ],
          currentIndex: _currentIndex,
          onTap: onTabTapped,
          selectedItemColor: HaxColor.colorDarkGreen,
          unselectedItemColor: Colors.white,
          backgroundColor: HaxColor.colorOrange,
        ),
      ),
    );
  }
}
