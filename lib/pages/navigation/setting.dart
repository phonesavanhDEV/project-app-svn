import 'package:flutter/material.dart';

import '../../bloc_auth/models/modelsUser/User.dart';
import '../../bloc_auth/screens/RegisterScreen/RegisterPage.dart';
import '../../bloc_auth/widgets/getUser.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final _userController = TextEditingController();

  @override
  void dispose() {
    _userController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/register'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.orangeAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.account_circle_sharp,
                      color: Colors.white,
                    ),
                    SizedBox(width: 8),
                    Text(
                      "ສ້າງບັນຊີຜູ້ໃຊ້",
                      style: TextStyle(
                        fontFamily: 'NotoSansLao',
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.0),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () =>
                    Navigator.pushNamed(context, '/changePassword'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.orangeAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.password,
                      color: Colors.white,
                    ),
                    SizedBox(width: 8),
                    Text(
                      "ປ່ຽນລະຫັດ",
                      style: TextStyle(
                        fontFamily: 'NotoSansLao',
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.0),
            // SizedBox(
            //   width: double.infinity,
            //   height: 55,
            //   child: ElevatedButton(
            //     onPressed: () {},
            //     // onPressed: () =>
            //     //     Navigator.pushNamed(context, '/changePassword'),
            //     style: ElevatedButton.styleFrom(
            //       primary: Colors.orangeAccent,
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(15),
            //       ),
            //     ),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         Icon(
            //           Icons.info,
            //           color: Colors.white,
            //         ),
            //         SizedBox(width: 8),
            //         Text(
            //           "ກ່ຽວກັບ",
            //           style: TextStyle(
            //             fontFamily: 'NotoSansLao',
            //             color: Colors.white,
            //             fontSize: 18,
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
