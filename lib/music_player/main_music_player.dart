import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './home_music_player.dart';
import './player_model.dart';

class MainMusicPlayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Music Player',
      debugShowCheckedModeBanner: false,
      //theme: ThemeData.light(),
      home: ChangeNotifierProvider(
          create: (_) => PlayerModel(), child: HomeMusicPlayer()),
    );
  }
}
