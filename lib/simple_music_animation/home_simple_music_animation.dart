import 'package:flutter/material.dart';

class HomeSimpleMusicAnimation extends StatelessWidget {
  const HomeSimpleMusicAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        child: _MusicVisualizer(),
      )),
      backgroundColor: Color(0xFF121414),
    );
  }
}

class _MusicVisualizer extends StatelessWidget {
  final List<Color> colors = [
    Colors.blueAccent,
    Colors.greenAccent,
    Colors.deepPurpleAccent,
    Colors.redAccent,
    Colors.yellowAccent,
    Colors.limeAccent,
    Colors.indigoAccent,
    Colors.lightGreenAccent,
    Colors.tealAccent,
    Colors.orangeAccent,
  ];
  final List<int> duration = [
    900,
    300,
    930,
    500,
    700,
    200,
    1000,
    400,
    800,
    600,
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
          colors.length,
          (index) => VisualComponent(
              duration: duration[index % 6], color: colors[index])),
    );
  }
}

class VisualComponent extends StatefulWidget {
  const VisualComponent({Key? key, required this.duration, required this.color})
      : super(key: key);

  final int duration;
  final Color color;

  @override
  _VisualComponentState createState() => _VisualComponentState();
}

class _VisualComponentState extends State<VisualComponent>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        duration: Duration(milliseconds: widget.duration), vsync: this);
    final curvedAnimation = CurvedAnimation(
        parent: animationController, curve: Curves.easeInOutSine);
    animation = Tween<double>(begin: 0, end: 100).animate(curvedAnimation)
      ..addListener(() {
        setState(() {});
      });
    animationController.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      height: animation.value,
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }
}
