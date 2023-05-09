import 'package:flutter/material.dart';

class FontNotosan {
  static TextStyle textStyle({
    double fontSize = 16,
    FontWeight fontWeight = FontWeight.normal,
    Color color = Colors.black,
  }) {
    return TextStyle(
      fontFamily: 'NotoSans',
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }
}


// Text(
//   'ສ້າງບັນຊີໃໝ່',
//   style: FontNotosan.textStyle(
//     fontSize: 20,
//     fontWeight: FontWeight.bold,
//     color: Colors.white,
//   ),
// ),