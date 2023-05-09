import 'package:flutter/material.dart';

import 'package:svn_costing_profit/bloc_auth/screens/LoginScreen/LoginPage.dart';
import 'package:svn_costing_profit/contact/HaxColors.dart';

import '../login/LoginBloc.dart';
import 'package:http/http.dart' as http;

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final double barHeight = 25;

  CustomAppBar({required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, textAlign: TextAlign.center),
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
          // Navigate back to the previous screen
          Navigator.pushNamed(context, '/login');
        },
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + barHeight);
}
