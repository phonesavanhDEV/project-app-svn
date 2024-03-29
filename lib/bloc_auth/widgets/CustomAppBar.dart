import 'package:flutter/material.dart';

import 'package:svn_costing_profit/contact/HaxColors.dart';
import 'package:svn_costing_profit/pages/HomePage.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final double barHeight = 25;

  CustomAppBar({required this.title});

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
          //Navigator.pushNamed(context, '/home');

          // if (title == 'ສ້າງບັນຊີໃໝ່') {
          //   Navigator.pushNamed(context, '/login');
          // } else {
          //   // Navigator.pushNamed(context, '/home');
          //   Navigator.push(
          //     context,
          //     MaterialPageRoute(builder: (context) => HomeScreen()),
          //   );
          // }
        },
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + barHeight);
}
