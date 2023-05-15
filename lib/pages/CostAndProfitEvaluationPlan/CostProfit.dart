import 'package:flutter/material.dart';
import 'package:svn_costing_profit/contact/HaxColors.dart';

class CostProfit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ແຜນປະເມີນການຕົ້ນທຶນ&ກຳໄລ',
          style: TextStyle(
            fontSize: 20.0,
            // fontWeight: FontWeight.bold,
            color: Colors.white,
            fontFamily: 'NotoSansLao',
          ),
        ),
        backgroundColor: HaxColor.colorOrange,
      ),
    );
  }
}
