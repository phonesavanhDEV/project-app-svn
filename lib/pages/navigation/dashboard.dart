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
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20.0),
                child: SizedBox(
                  width: 125.0,
                  height: 100.0,
                  child: MaterialButton(
                    color: Colors.orangeAccent,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/money-white.png',
                          width: 50.0,
                          height: 50.0,
                          fit: BoxFit.fill,
                        ),
                        Text(
                          "ແຜນປະເມີນການຕົ້ນທຶນ&ກຳໄລ",
                          style: TextStyle(
                            fontSize: 10.0,
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
                padding: EdgeInsets.all(20.0),
                child: SizedBox(
                  width: 125.0,
                  height: 100.0,
                  child: MaterialButton(
                    color: Colors.orangeAccent,
                    child: Text(
                      "",
                      style: TextStyle(
                        fontSize: 10.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'NotoSansLao',
                      ),
                    ),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("coming soon...!!!"),
                        backgroundColor: Colors.red,
                      ));
                    },
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
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20.0),
                child: SizedBox(
                  width: 125.0,
                  height: 100.0,
                  child: MaterialButton(
                    color: Colors.orangeAccent,
                    child: Text(
                      "",
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'NotoSansLao',
                      ),
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
                padding: EdgeInsets.all(20.0),
                child: SizedBox(
                  width: 125.0,
                  height: 100.0,
                  child: MaterialButton(
                    color: Colors.orangeAccent,
                    child: Text(
                      "",
                      style: TextStyle(
                        fontSize: 10.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'NotoSansLao',
                      ),
                    ),
                    onPressed: () {
                      // Do something when the button is pressed.
                    },
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
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20.0),
                child: SizedBox(
                  width: 125.0,
                  height: 100.0,
                  child: MaterialButton(
                    color: Colors.orangeAccent,
                    child: Text(
                      "",
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'NotoSansLao',
                      ),
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
                padding: EdgeInsets.all(20.0),
                child: SizedBox(
                  width: 125.0,
                  height: 100.0,
                  child: MaterialButton(
                    color: Colors.orangeAccent,
                    child: Text(
                      "",
                      style: TextStyle(
                        fontSize: 10.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'NotoSansLao',
                      ),
                    ),
                    onPressed: () {
                      // Do something when the button is pressed.
                    },
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
          ),
        ],
      )),
    );
  }
}
