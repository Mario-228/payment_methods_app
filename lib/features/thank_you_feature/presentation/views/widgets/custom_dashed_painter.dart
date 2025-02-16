import 'package:flutter/material.dart';

class CustomDashedPainter extends CustomPainter {
  final double dashWidth;
  final double dashSpace;
  final Color color;

  CustomDashedPainter(this.dashWidth, this.dashSpace, this.color);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..strokeWidth = size.height;

    double startX = 0;
    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, size.height / 2),
        Offset(startX + dashWidth, size.height / 2),
        paint,
      );
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
