import 'package:flutter/material.dart';
import 'package:svn_costing_profit/contact/HaxColors.dart';

import '../../bloc_auth/screens/LoginScreen/FormShowDialog.dart';
import '../../network/CheckNetwork.dart';

class CostProfit extends StatefulWidget {
  @override
  _CostProfit createState() => _CostProfit();
}

class _CostProfit extends State<CostProfit> {
  final InternetConnectivity internetConnectivity = InternetConnectivity();

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
            onPressed: () {
              // Perform search operation
            },
          ),
        ],
      ),
    );
  }
}
