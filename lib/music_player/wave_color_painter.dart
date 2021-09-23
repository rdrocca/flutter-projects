import 'package:flutter/material.dart';
import 'dart:math';

class WaveColorPainter extends CustomPainter {
  WaveColorPainter(this.animation) : super(repaint: animation);

  final Animation<double> animation;
  // Paint _paint = Paint();
  //List<Color>? colors;

  @override
  void paint(Canvas canvas, Size size) {
    //List<Color> colors = List.from(Colors.accents);
    List<Color> colors = List.from(Colors.accents);
    colors.removeRange(6, 13);
    List<Color> gradColors = colors
        .map(
            (color) => color.withOpacity(Random().nextDouble().clamp(0.5, 0.9)))
        .toList();
    final Gradient gradient = LinearGradient(colors: gradColors);

    final _paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5
      ..strokeCap = StrokeCap.round
      ..shader = gradient.createShader(Rect.fromLTWH(0, 20, size.width, 40));

    canvas.translate(0, size.height / 2);
    canvas.scale(1, -1);

    for (double i = animation.value; i < size.width.toInt(); i++) {
      double r = 2 * sin(i) - 2 * cos(4 * i) + sin(2 * i - pi * 24);
      r = r * 5;
      canvas.drawLine(Offset(i, r), Offset(i, -r), _paint);
    }
  }

  @override
  //bool shouldRepaint(WaveColorPainter oldDelegate) =>oldDelegate.colors != colors;
  bool shouldRepaint(WaveColorPainter oldDelegate) => false;

  // @override
  // bool shouldRebuildSemantics(WaveColorPainter oldDelegate) => false;
}
