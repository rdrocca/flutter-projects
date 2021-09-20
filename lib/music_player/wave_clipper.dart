import 'package:flutter/material.dart';

class WaveClipper extends CustomClipper<Rect> {
  // late Rect rect;

  WaveClipper(this.waveFraction);

  final double waveFraction;

  @override
  Rect getClip(Size size) {
    final rect = Rect.fromLTWH(0, 0, waveFraction, 2 * size.height);
    return rect;
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) => true;
}
