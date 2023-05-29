import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:svn_costing_profit/contact/HaxColors.dart';

import '../bloc_auth/models/modelsUser/User.dart';
import 'navigation/dashboard.dart';

import 'navigation/setting.dart';
import 'widgets/CustomAppBarHeader.dart';
import '../bloc_auth/screens/LoginScreen/LoginPage.dart';

class HomeScreen extends StatefulWidget {
  final User user;

  HomeScreen({required this.user});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    Dashboard(),
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
        employeecode: '${widget.user.employee_code}',
        fullname: '${widget.user.user_fullname}',
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
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
        unselectedFontSize: 12,
        selectedFontSize: 16,
        unselectedLabelStyle: TextStyle(fontFamily: 'NotoSansLao'),
        selectedLabelStyle: TextStyle(fontFamily: 'NotoSansLao'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.white,
        child: Image.asset(
          'assets/images/new_souvanny.png',
          width: 60,
          height: 60,
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
    );
  }
}
