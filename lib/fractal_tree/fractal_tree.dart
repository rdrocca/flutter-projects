import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_projects/fractal_tree/branch.dart';

class FractalTree extends StatefulWidget {
  static const Color white = Color(0xffffffff);
  static const Color black = Color(0xff000000);
  static const defaultSize = Size(320, 400);

  FractalTree({
    Key? key,
    Color lineColor: white,
    Color backgroundColor: black,
    Size size: defaultSize,
  })  : lineColor = lineColor,
        backgroundColor = backgroundColor,
        size = size,
        super(key: key);
  final Color lineColor;
  final Color backgroundColor;
  final Size size;

  @override
  _FractalTreeState createState() => _FractalTreeState();
}

class _FractalTreeState extends State<FractalTree> {
  double ratio = .67;
  double phi = pi / 6;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          color: widget.backgroundColor,
          height: widget.size.height,
          width: widget.size.width,
          child: CustomPaint(
            painter: LinePainter(phi),
          ),
        ),
        Slider(
          value: phi,
          onChanged: (value) => setState(() => phi = value),
          min: 0,
          max: pi,
        ),
      ],
    );
  }
}

class LinePainter extends CustomPainter {
  const LinePainter(this.phi);

  final double phi;

  @override
  void paint(Canvas canvas, Size size) {
    final _whitePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1
      ..color = FractalTree.white;

    final _pinkPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1
      ..color = Colors.pink;

    final xRef = size.width / 2;
    final yRef = size.height;
    Offset transform(Offset offset) {
      return Offset(xRef - offset.dx, yRef - offset.dy);
    }

    void drawBranch(Branch branch) {
      final paint = branch.lenghtSquared > 60 ? _whitePaint : _pinkPaint;
      canvas.drawLine(transform(branch.origin), transform(branch.end), paint);
    }

    final scale = .7;
    void drawTree(Branch b) {
      drawBranch(b);
      if (b.lenghtSquared > 16) {
        final bLeft = b.createChild(scale, -phi);
        drawTree(bLeft);
        final bRight = b.createChild(scale, phi);
        drawTree(bRight);
      }
    }

    // final b = Branch(null, Offset(0,80));
    final b = Branch(null, Offset(0, 80));
    drawTree(b);
  }

  @override
  bool shouldRepaint(LinePainter oldDelegate) => oldDelegate.phi != phi;

  // @override
  // bool shouldRebuildSemantics(LinePainter oldDelegate) => false;
}
