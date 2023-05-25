import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../bloc_auth/screens/LoginScreen/FormShowDialog.dart';
import '../../network/CheckNetwork.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
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
    return Container(
      alignment: Alignment.topCenter,
      child: LayoutBuilder(
        builder: (context, constraints) {
          double paddingValue = MediaQuery.of(context).size.width * 0.02;
          return Wrap(
            alignment: WrapAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(paddingValue),
                child: SizedBox(
                  width: 165.0,
                  height: 150.0,
                  child: MaterialButton(
                    color: Colors.orangeAccent,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/money-white.png',
                          width: 80.0,
                          height: 80.0,
                          fit: BoxFit.fill,
                        ),
                        Text(
                          "ແຜນປະເມີນການຕົ້ນທຶນ&ກຳໄລ",
                          style: TextStyle(
                            fontSize: 11.5,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontFamily: 'NotoSansLao',
                          ),
                        ),
                      ],
                    ),
                    onPressed: () =>
                        Navigator.pushNamed(context, '/costprofit'),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      side: BorderSide(
                        color: Colors.white,
                        width: 2.0,
                      ),
                    ),
                    splashColor: Colors.redAccent,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(paddingValue),
                child: SizedBox(
                  width: 165.0,
                  height: 150.0,
                  child: MaterialButton(
                    color: Colors.orangeAccent,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Image.asset(
                        //   'assets/images/money-white.png',
                        //   width: 80.0,
                        //   height: 80.0,
                        //   fit: BoxFit.fill,
                        // ),
                        Text(
                          "",
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontFamily: 'NotoSansLao',
                          ),
                        ),
                      ],
                    ),
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      side: BorderSide(
                        color: Colors.white,
                        width: 2.0,
                      ),
                    ),
                    splashColor: Colors.redAccent,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(paddingValue),
                child: SizedBox(
                  width: 165.0,
                  height: 150.0,
                  child: MaterialButton(
                    color: Colors.orangeAccent,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Image.asset(
                        //   'assets/images/money-white.png',
                        //   width: 80.0,
                        //   height: 80.0,
                        //   fit: BoxFit.fill,
                        // ),
                        Text(
                          "",
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontFamily: 'NotoSansLao',
                          ),
                        ),
                      ],
                    ),
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      side: BorderSide(
                        color: Colors.white,
                        width: 2.0,
                      ),
                    ),
                    splashColor: Colors.redAccent,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(paddingValue),
                child: SizedBox(
                  width: 165.0,
                  height: 150.0,
                  child: MaterialButton(
                    color: Colors.orangeAccent,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Image.asset(
                        //   'assets/images/money-white.png',
                        //   width: 80.0,
                        //   height: 80.0,
                        //   fit: BoxFit.fill,
                        // ),
                        Text(
                          "",
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontFamily: 'NotoSansLao',
                          ),
                        ),
                      ],
                    ),
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      side: BorderSide(
                        color: Colors.white,
                        width: 2.0,
                      ),
                    ),
                    splashColor: Colors.redAccent,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
