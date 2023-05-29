import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:svn_costing_profit/contact/HaxColors.dart';
import 'package:svn_costing_profit/pages/CostAndProfitEvaluationPlan/widgetAlertSearch.dart';

import '../../bloc_auth/screens/LoginScreen/FormShowDialog.dart';
import '../../network/CheckNetwork.dart';

class CostProfit extends StatefulWidget {
  @override
  _CostProfit createState() => _CostProfit();
}

class _CostProfit extends State<CostProfit> {
  final InternetConnectivity internetConnectivity = InternetConnectivity();
  final _ProductID = TextEditingController();

  String dropdownvalue = 'Item 1';

  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  @override
  void initState() {
    super.initState();

    internetConnectivity.startMonitoringConnectivity((isConnected) {
      if (!isConnected) {
        FormShowDialog.showAlertDialog(
            context, 'ຂໍອະໄພ! ມີບັນຫາໃນການເຊື່ອມຕໍ່');
      }
    });
  }

  @override
  void dispose() {
    internetConnectivity.stopMonitoringConnectivity();
    super.dispose();
  }

  void _showAlert() {
    showDialog(
      context: context,
      builder: (context) => AlertDialogSearch(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ແຜນປະເມີນການຕົ້ນທຶນ&ກຳໄລ',
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
            fontFamily: 'NotoSansLao',
          ),
        ),
        backgroundColor: HaxColor.colorOrange,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () => Navigator.pushNamed(context, '/searchCosting'),
          ),
        ],
      ),
    );
  }
}
