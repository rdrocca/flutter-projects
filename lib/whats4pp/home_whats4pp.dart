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

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this, initialIndex: 1);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Whats4pp"),
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
      body: TabBarView(
        controller: _tabController,
        children: [
          CameraTab(),
          ChatsTab(),
          StatusTab(),
          CallsTab(),
        ],
      ),
    );
  }
}
