import 'dart:ui';

import 'package:flutter/material.dart';

class AlertRegister {
  static void showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
          child: Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  child: CircularProgressIndicator(
                    strokeWidth: 4,
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Colors.deepOrangeAccent),
                  ),
                  height: 50,
                  width: 50,
                ),
                Image.asset(
                  'assets/images/new_souvanny.png',
                  width: 45,
                  height: 45,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // static void showSuccess(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     barrierDismissible: false,
  //     builder: (BuildContext context) {
  //       return BackdropFilter(
  //         filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
  //         child: AlertDialog(
  //           title: Text('ບັນທືກ'),
  //           content: Text('ສຳເລັດແລ້ວ'),
  //           actions: [
  //             ElevatedButton(
  //               style: ElevatedButton.styleFrom(
  //                 primary: Colors.orange,
  //                 shape: RoundedRectangleBorder(
  //                   borderRadius: BorderRadius.circular(30),
  //                 ),
  //               ),
  //               onPressed: () => Navigator.of(context).pop(),
  //               child: Text(
  //                 'ຕົກລົງ',
  //                 style: TextStyle(
  //                   fontFamily: 'NotoSansLao',
  //                   color: Colors.white,
  //                   fontWeight: FontWeight.bold,
  //                   fontSize: 16,
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }
}
