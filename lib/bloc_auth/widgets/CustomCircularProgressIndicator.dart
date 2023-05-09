import 'package:flutter/material.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  final IconData icon;
  final double size;
  final Color color;
  final double strokeWidth;

  CustomCircularProgressIndicator({
    required this.icon,
    this.size = 32.0,
    this.color = Colors.blue,
    this.strokeWidth = 4.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(color),
            strokeWidth: strokeWidth,
          ),
          Icon(
            icon,
            color: color,
            size: size * 0.5,
          ),
        ],
      ),
    );
  }
}
