import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class SnakeButton extends StatefulWidget {
  const SnakeButton({
    Key? key,
    this.duration = const Duration(seconds: 9),
    required this.title,
    required this.onTap,
  }) : super(key: key);
  final String title;
  final Duration duration;
  final VoidCallback onTap;
  @override
  _SnakeButtonState createState() => _SnakeButtonState();
}

class _SnakeButtonState extends State<SnakeButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    //_controller.reverse();
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
      child: InkWell(
        onTap: widget.onTap,
        child: CustomPaint(
          painter: _SnakePainter(
            animation: _controller,
            snakeColor: Colors.white,
            backgroundColor: Colors.grey.shade900,
            borderColor: Colors.grey.shade900,
          ),
          child: Container(
            padding: const EdgeInsets.all(15.0),
            alignment: Alignment.center,
            child: Text(
              widget.title,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

class _SnakePainter extends CustomPainter {
  _SnakePainter(
      {required this.animation,
      required this.snakeColor,
      required this.backgroundColor,
      required this.borderColor})
      : super(repaint: animation);
  final Animation animation;
  final Color snakeColor;
  final Color backgroundColor;
  final Color borderColor;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final path = Path()..addRect(rect);

    // final path2 = Path()..addRect(rect..deflate(45.0));
    // var path = Path.combine(PathOperation.xor, path1, path2);

    //final path = Path.combine(
    //  PathOperation.xor,
    //  //Path()..,
    //  Path()..addRect(rect),
    //  Path()..addRect(rect..deflate(2.0)),
    //);

    canvas.drawPath(
        path,
        Paint()
          ..shader = SweepGradient(
            colors: [borderColor, snakeColor, borderColor],
            //stops: [0, 0.9, 1.0],
            startAngle: 0.0,
            endAngle: vector.radians(90),
            transform:
                GradientRotation(vector.radians(360.0 * animation.value)),
          ).createShader(rect));

    canvas.drawRect(
        rect.deflate(3.0),
        Paint()
          ..color = backgroundColor
          //..strokeWidth = 6.0
          ..style = PaintingStyle.fill);
  }

  @override
  bool shouldRepaint(_SnakePainter oldDelegate) => false;

  //@override
  //bool shouldRebuildSemantics(_SnakePainter oldDelegate) => false;
}
