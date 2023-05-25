import 'dart:math';

import 'package:flutter/material.dart';
import 'package:svn_costing_profit/contact/HaxColors.dart';

class CustomAppBarHeader extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final String employeecode;
  final String fullname;
  final double barHeight = 75;

  CustomAppBarHeader({
    required this.title,
    required this.employeecode,
    required this.fullname,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: HaxColor.colorOrange,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(48.0),
        ),
        side: BorderSide(
          color: Colors.white,
          width: 2.0,
        ),
      ),
      flexibleSpace: ClipRRect(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(48.0),
        ),
        child: Stack(
          children: [
            // Positioned(
            //   left: 16.0,
            //   bottom: 16.0,
            //   child: Transform(
            //     alignment: Alignment.center,
            //     transform: Matrix4.rotationY(pi),
            //     child: Transform(
            //       alignment: Alignment.center,
            //       transform: Matrix4.rotationY(pi),
            //       child: Container(
            //         width: 100.0,
            //         height: 100.0,
            //         decoration: BoxDecoration(
            //           shape: BoxShape.circle,
            //           border: Border.all(
            //             color: Colors.white,
            //             width: 2.0,
            //           ),
            //           image: DecorationImage(
            //             image: AssetImage('assets/images/new_souvanny.png'),
            //             fit: BoxFit.cover,
            //           ),
            //         ),
            //         padding: EdgeInsets.all(8.0),
            //       ),
            //     ),
            //   ),
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontFamily: 'NotoSansLao',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        shadows: [
                          Shadow(
                            color: Colors.grey,
                            blurRadius: 10.0,
                            offset: Offset(5.0, 5.0),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                        width:
                            8.0), // Add space between the title and employeecode
                    Text(
                      employeecode,
                      style: TextStyle(
                        fontFamily: 'NotoSansLao',
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      fullname,
                      textAlign: TextAlign.right, // Align the text to the right
                      style: TextStyle(
                        fontFamily: 'NotoSansLao',
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(10.0),
        child: Padding(
          padding: EdgeInsets.only(bottom: 10.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.circular(50.0),
            ),
            width: 80.0,
            height: 10.0,
            child: Center(
              child: SizedBox(
                height: 10.0,
                width: 80.0,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + barHeight);
}
