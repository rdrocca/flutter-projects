// https://github.com/diegoveloper/flutter-samples/tree/master/lib
// https://github.com/jiang111/flutter_code

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Projects"),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: ListView(
          children: <Widget>[
            MyMenuButton(
              title: "Whats4pp",
              actionTap: () {
                onButtonTap(
                  MainWhats4pp(),
                );
              },
            ),
            MyMenuButton(
              title: "State Management",
              actionTap: () {
                onButtonTap(
                  MainStateMngmnt(),
                );
              },
            ),
            MyMenuButton(
              title: "Fetch Data JSON",
              actionTap: () {
                onButtonTap(
                  MainFetchData(),
                );
              },
            ),
            MyMenuButton(
              title: "Travel Bean",
              actionTap: () {
                onButtonTap(
                  MainTravelBean(),
                );
              },
            ),
            MyMenuButton(
              title: "Pageview - Transform",
              actionTap: () {
                onButtonTap(
                  MainPageviewTransform(),
                );
              },
            ),
            MyMenuButton(
                title: "Clubhouse",
                actionTap: () {
                  onButtonTap(
                    MainClubhouse(),
                  );
                }),
            MyMenuButton(
              title: "Collapsing Toolbar",
              actionTap: () {
                onButtonTap(
                  MainTimeline(),
                );
              },
            ),
            MyMenuButton(
                title: "Fractal Tree",
                actionTap: () {
                  onButtonTap(
                    MainFractalTree(),
                  );
                }),
            MyMenuButton(
              title: "Simple Music Animation",
              actionTap: () {
                onButtonTap(
                  MainSimpleMusicAnimation(),
                );
              },
            ),
            MyMenuButton(
              title: "Music Player",
              actionTap: () {
                onButtonTap(
                  MainMusicPlayer(),
                );
              },
            ),
            // MyMenuButton(
            //   title: "ScrollController and ScrollNotification",
            //   actionTap: () {
            //     onButtonTap(
            //       MainScrollController(),
            //     );
            //   },
            // ),
            // MyMenuButton(
            //   title: "Apps Clone",
            //   actionTap: () {
            //     onButtonTap(
            //       MainAppsClone(),
            //     );
            //   },
            // ),
            // MyMenuButton(
            //   title: "Animations",
            //   actionTap: () {
            //     onButtonTap(
            //       MainAnimations(),
            //     );
            //   },
            // ),
            // MyMenuButton(
            //   title: "Communication Widgets",
            //   actionTap: () {
            //     onButtonTap(
            //       MainCommunicationWidgets(),
            //     );
            //   },
            // ),
            // MyMenuButton(
            //   title: "Split Image",
            //   actionTap: () {
            //     onButtonTap(MainSplitImage());
            //   },
            // ),
            // MyMenuButton(
            //   title: "Custom AppBar & SliverAppBar",
            //   actionTap: () {
            //     onButtonTap(MainAppBarSliverAppBar());
            //   },
            // ),
            // MyMenuButton(
            //   title: "Menu Navigations",
            //   actionTap: () {
            //     onButtonTap(MainMenuNavigations());
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}

class MyMenuButton extends StatelessWidget {
  MyMenuButton({required this.title, required this.actionTap});

  final String title;
  final VoidCallback actionTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: MaterialButton(
        height: 50.0,
        color: Theme.of(context).primaryColor,
        textColor: Colors.white,
        child: new Text(title),
        onPressed: actionTap,
      ),
    );
  }
}
