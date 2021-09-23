import 'package:flutter/material.dart';
import 'package:flutter_projects/music_player/player_model.dart';
import 'package:flutter_projects/music_player/wave_base_painter.dart';
import 'package:flutter_projects/music_player/wave_clipper.dart';
import 'package:flutter_projects/music_player/wave_color_painter.dart';
import 'package:provider/provider.dart';

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
  PlayerModel? playerModel;
  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3))
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

    playerModel = Provider.of<PlayerModel>(context);

    return Scaffold(
      backgroundColor: Color(0xff7a5ebb),
      body: Stack(
        children: [
          Positioned(
              top: 210, width: width, height: height, child: buildMusicList()),
          Positioned(
            top: height / 2,
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
      height: 300,
      width: 300,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/music_player/vinyl.png"),
              fit: BoxFit.fitHeight,
              colorFilter:
                  ColorFilter.mode(Colors.blue.shade300, BlendMode.color)),
          shape: BoxShape.circle),
      child: ClipOval(
        child: Image.asset(
          "images/music_player/cover.jpg",
          height: 210,
          width: 210,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget buildWave(double _width) {
    return Container(
      width: 5 / 7 * _width * _waveAnimation.value,
      height: 40,
      //  color: Colors.black,
      child: CustomPaint(
        painter: WaveBasePainter(),
        child: ClipRect(
          clipper: WaveClipper(_waveConstAmpAnimation.value * _width),
          child: CustomPaint(
            painter: WaveBasePainter(),
            foregroundPainter: WaveColorPainter(_waveAnimation),
          ),
        ),
      ),
    );
  }

  ListView buildMusicList() {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: playerModel!.musicList.length,
      itemBuilder: (BuildContext context, int index) {
        bool isIndexCurrentTrack = false;
        if (index == playerModel!.currentTrack) isIndexCurrentTrack = true;

        return Container(
          color: Color(0xff6a52a4),
          child: GestureDetector(
            onTap: () {
              if (!isIndexCurrentTrack) {
                playerModel!.resetList();
                _animationController.reset();
              }
              playerModel!.currentTrack = index;
              playerModel!.musicList[index].isPlaying =
                  !playerModel!.musicList[index].isPlaying;
            },
            child: ListTile(
              leading: Icon(Icons.bubble_chart),
              title: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: Text(playerModel!.musicList[index].name)),
              subtitle: Text(playerModel!.musicList[index].name),
              trailing: Text(playerModel!.musicList[index].duration
                  .toString()
                  .substring(3, 7)),
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) => Divider(
        thickness: 1,
        height: 0,
        color: Colors.grey,
      ),
    );
  }
}
