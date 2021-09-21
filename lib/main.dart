// https://github.com/diegoveloper/flutter-samples/tree/master/lib
// https://github.com/jiang111/flutter_code

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_projects/snake_button.dart';
import 'package:flutter_projects/snake_game/main_snake_game.dart';
import 'package:flutter_projects/state_mngmnt/main_state_mngmnt.dart';

import './clubhouse/main_clubhouse.dart';
import './fetch_data/main_fetch_data.dart';
import './fractal_tree/main_whats4pp.dart';
import './music_player/main_music_player.dart';
import './pageview_transform/main_pageview_transform.dart';
import './simple_music_animation/main_simple_music_animation.dart';
import './travel_bean/main_travel_bean.dart';
import './timeline/main_timeline.dart';
import './whats4pp/main_whats4pp.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        //theme: ThemeData( primarySwatch: Colors.blue ),
        theme: ThemeData.dark(),
        home: MyApp(),
      ),
    );

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  onButtonTap(Widget page) {
    Navigator.push(
        context, MaterialPageRoute(builder: (BuildContext context) => page));
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Projects"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: ListView(
          children: <Widget>[
            SnakeButton(
              title: "Whats4pp",
              onTap: () {
                onButtonTap(
                  MainWhats4pp(),
                );
              },
            ),
            SnakeButton(
              title: "Snake Game",
              onTap: () {
                onButtonTap(
                  MainSnakeGame(),
                );
              },
            ),
            MyMenuButton(
              title: "State Management",
              onTap: () {
                onButtonTap(
                  MainStateMngmnt(),
                );
              },
            ),
            MyMenuButton(
              title: "Fetch Data JSON",
              onTap: () {
                onButtonTap(
                  MainFetchData(),
                );
              },
            ),
            MyMenuButton(
              title: "Travel Bean",
              onTap: () {
                onButtonTap(
                  MainTravelBean(),
                );
              },
            ),
            MyMenuButton(
              title: "Pageview - Transform",
              onTap: () {
                onButtonTap(
                  MainPageviewTransform(),
                );
              },
            ),
            SnakeButton(
                title: "Clubhouse",
                onTap: () {
                  onButtonTap(
                    MainClubhouse(),
                  );
                }),
            MyMenuButton(
              title: "Collapsing Toolbar",
              onTap: () {
                onButtonTap(
                  MainTimeline(),
                );
              },
            ),
            MyMenuButton(
                title: "Fractal Tree",
                onTap: () {
                  onButtonTap(
                    MainFractalTree(),
                  );
                }),
            MyMenuButton(
              title: "Simple Music Animation",
              onTap: () {
                onButtonTap(
                  MainSimpleMusicAnimation(),
                );
              },
            ),
            MyMenuButton(
              title: "Music Player",
              onTap: () {
                onButtonTap(
                  MainMusicPlayer(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MyMenuButton extends StatelessWidget {
  MyMenuButton({required this.title, required this.onTap});

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: MaterialButton(
        height: 50.0,
        color: Theme.of(context).primaryColor,
        textColor: Colors.white,
        child: new Text(title),
        onPressed: onTap,
      ),
    );
  }
}
