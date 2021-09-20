import 'package:flutter/material.dart';
import 'package:flutter_projects/music_player/wave_base_painter.dart';
import 'package:flutter_projects/music_player/wave_clipper.dart';
import 'package:flutter_projects/music_player/wave_color_painter.dart';

class HomeMusicPlayer extends StatefulWidget {
  const HomeMusicPlayer({Key? key}) : super(key: key);

  @override
  _HomeMusicPlayerState createState() => _HomeMusicPlayerState();
}

class _HomeMusicPlayerState extends State<HomeMusicPlayer>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _waveAnimation;
  late Animation<double> _waveConstAmpAnimation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 18))
          ..addListener(() => setState(() {}));
    _waveAnimation =
        Tween<double>(begin: 1, end: 1).animate(_animationController);
    _waveConstAmpAnimation =
        Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInSine,
    ));
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            width: width,
            height: height,
            child: Material(
              elevation: 18,
              color: Color(0xffd6dde5),
              borderRadius: BorderRadius.circular(18),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  children: [
                    SizedBox(height: 90),
                    Text("Music Title"),
                    SizedBox(height: 15),
                    Text("Music Artist"),
                    SizedBox(height: 75),
                    buildRecordPlayer(),
                    SizedBox(height: 60),
                    Row(
                      children: [
                        Text("Time"),
                        SizedBox(width: 8),
                        buildWave(width),
                        SizedBox(width: 8),
                        Text("end"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildRecordPlayer() {
    return Container(
      height: 270,
      width: 270,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/music_player/vinyl.png"),
              fit: BoxFit.fitHeight,
              colorFilter: ColorFilter.mode(Colors.black, BlendMode.color)),
          shape: BoxShape.circle),
      child: ClipOval(
        child: Image.asset(
          "images/music_player/cover.jpg",
          height: 150,
          width: 150,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget buildWave(double _width) {
    return Container(
        width: 270 * _waveConstAmpAnimation.value,
        height: 40,
        child: CustomPaint(
            painter: WaveBasePainter(),
            child: ClipRect(
                clipper: WaveClipper(_waveConstAmpAnimation.value * _width),
                child: CustomPaint(
                  painter: WaveBasePainter(),
                  foregroundPainter: WaveColorPainter(_waveAnimation),
                ))));
  }
}
