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
            child: Container(
              height: 80,
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    strokeWidth: 4,
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Colors.deepOrangeAccent),
                  ),
                  SizedBox(width: 16),
                  Text('ກຳລັງໂຫລດ...',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      )),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
