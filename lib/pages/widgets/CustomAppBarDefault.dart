import 'package:flutter/material.dart';

import 'package:svn_costing_profit/contact/HaxColors.dart';
import 'package:svn_costing_profit/pages/HomePage.dart';

import '../../bloc_auth/models/User.dart';

class CustomAppBarDefault extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final double barHeight = 25;
  final User user;

  CustomAppBarDefault({required this.title, required this.user});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: 'NotoSansLao',
          color: Colors.white,
          fontSize: 20,
        ),
      ),
      centerTitle: true,
      backgroundColor: HaxColor.colorOrange,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(48.0),
        ),
      ),
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () {
          // Navigator.pushNamed(context, '/home');
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen(user: user)),
          );
        },
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + barHeight);
}
