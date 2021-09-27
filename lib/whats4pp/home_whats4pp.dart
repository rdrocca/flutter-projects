import 'package:flutter/material.dart';

import './screens/tabs/calls_tab.dart';
import './screens/tabs/camera_tab.dart';
import './screens/tabs/chats_tab.dart';
import './screens/tabs/status_tab.dart';

class HomeWhats4pp extends StatefulWidget {
  const HomeWhats4pp({Key? key}) : super(key: key);

  @override
  _HomeWhats4ppState createState() => _HomeWhats4ppState();
}

class _HomeWhats4ppState extends State<HomeWhats4pp>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late int _tabIndex;

  @override
  void initState() {
    super.initState();
    _tabIndex = 1;
    _tabController =
        TabController(length: 4, vsync: this, initialIndex: _tabIndex);
    _tabController.addListener(() {
      setState(() {
        _tabIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final showHeaders = true;
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              title: Text(
                "Whats4pp",
              ),
              centerTitle: true,
              pinned: _tabIndex == 0 ? false : showHeaders,
              floating: showHeaders,
              bottom: TabBar(
                controller: _tabController,
                tabs: [
                  Tab(icon: Icon(Icons.camera_alt_rounded)),
                  Tab(text: "CHATS"),
                  Tab(text: "STATUS"),
                  Tab(text: "CALLS"),
                ],
              ),
              actions: [
                IconButton(
                  padding: EdgeInsets.all(12.0),
                  icon: Icon(Icons.search),
                  tooltip: 'Search',
                  onPressed: () {
                    // handle the press
                  },
                ),
                IconButton(
                  padding: EdgeInsets.all(12.0),
                  icon: Icon(Icons.more_vert),
                  tooltip: 'More options',
                  onPressed: () {
                    // handle the press
                  },
                )
              ],
            ),
          ];
        },
        body: TabBarView(
          physics: BouncingScrollPhysics(),
          controller: _tabController,
          children: [
            CameraTab(),
            ChatsTab(),
            StatusTab(),
            CallsTab(),
          ],
        ),
      ),
    );
  }
}
