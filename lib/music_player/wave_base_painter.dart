import 'package:flutter/material.dart';
import 'dart:math';

class WaveBasePainter extends CustomPainter {
  // Paint _paint = Paint();

  @override
  void paint(Canvas canvas, Size size) {
    final _paint = Paint()
      ..color = Colors.grey.withOpacity(0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5
      ..strokeCap = StrokeCap.round;

    canvas.translate(0, size.height / 2);
    canvas.scale(1, -1);

    for (var i = 0; i < size.width.toInt(); i++) {
      double x = i.toDouble();
      double r = 2 * sin(i) - 2 * cos(4 * i) + sin(2 * i - pi * 24);
      r = r * 5;
      canvas.drawLine(Offset(x, r), Offset(x, -r), _paint);
    }
  }

  @override
  bool shouldRepaint(WaveBasePainter oldDelegate) => false;

  // @override
  // bool shouldRebuildSemantics(WaveBasePainter oldDelegate) => false;
}
