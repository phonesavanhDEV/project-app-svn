import 'dart:ui';

import 'package:flutter/material.dart';

class FormShowDialog {
  static void showAlertDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
        child: AlertDialog(
          title: Text('ເຄື່ອຂ່າຍອິນເຕີເນັດ'),
          content: Text(message),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                'ຕົກລົງ',
                style: TextStyle(
                  fontFamily: 'NotoSansLao',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static void showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
          child: Dialog(
            backgroundColor: Colors.transparent,
            child: Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    child: CircularProgressIndicator(
                      strokeWidth: 4,
                      valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.deepOrangeAccent),
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
          ),
        );
      },
    );
  }
}
