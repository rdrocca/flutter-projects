import 'dart:math';

import 'package:flutter/cupertino.dart';

class Branch {
  Branch(this.parent, this.end);

  final Branch parent;
  final Offset end;

  Offset get origin => parent?.end ?? Offset.zero;
  double get length => (end - origin).distance;
  double get lenghtSquared => (end - origin).distanceSquared;

  Branch createChild(double scale, double phi) {
    final vector = end - origin;
    final c = cos(phi);
    final s = sin(phi);
    final dx = end.dx + scale * (c * vector.dx - s * vector.dy);
    final dy = end.dy + scale * (s * vector.dx + c * vector.dy);
    return Branch(this, Offset(dx, dy));
  }
}
