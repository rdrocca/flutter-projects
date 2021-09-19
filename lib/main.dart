// https://github.com/diegoveloper/flutter-samples/tree/master/lib
// https://github.com/jiang111/flutter_code

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// import './animations/main_animations.dart';
// import './app_clone/main_apps_clone.dart';
// import './appbar_sliverappbar/main_appbar_sliverappbar.dart';
// import './collapsing_toolbar/main_collapsing_toolbar.dart';
// import './communication_widgets/main_communication_widgets.dart';
import './clubhouse/main_clubhouse.dart';
import './fetch_data/main_fetch_data.dart';
import './travel_bean/main_travel_bean.dart';
import './pageview_transform/main_pageview_transform.dart';
import './timeline/main_timeline.dart';
import './whats4pp/main_whats4pp.dart';
// import './hero_animations/main_hero_animations.dart';
// import './menu_navigations/main_menu_navigations.dart';
// import './persistent_tabbar/main_persistent_tabbar.dart';
// import './scroll_controller/main_scroll_controller.dart';
// import './size_and_position/main_size_and_position.dart';
// import './split_image/main_split_image.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyApp(),
    ));

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
            // MyMenuButton(
            //   title: "Hero Animations",
            //   actionTap: () {
            //     onButtonTap(
            //       MainHeroAnimationsPage(),
            //     );
            //   },
            // ),
            // MyMenuButton(
            //   title: "Size and Positions",
            //   actionTap: () {
            //     onButtonTap(
            //       MainSizeAndPosition(),
            //     );
            //   },
            // ),
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
  final String title;
  final VoidCallback actionTap;

  MyMenuButton({required this.title, required this.actionTap});

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
