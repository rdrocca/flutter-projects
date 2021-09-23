import 'dart:math';

import 'package:flutter/material.dart';

import 'data.dart';

class PlayerModel extends ChangeNotifier {
  List<Music> musicList = [];
  int _currentTrack = 0;

  PlayerModel() {
    for (int i = 0; i < Data.nameList.length; i++)
      musicList
          .add(Music(name: Data.nameList[i], artistName: Data.artistList[i]));

    musicList.forEach((musicItem) => musicItem.duration = Duration(
        minutes: Random().nextInt(5).clamp(1, 5),
        seconds: Random().nextInt(59)));

    //musicList.forEach((musicItem) => print(musicItem.name));
  }

  int get currentTrack => _currentTrack;
  set currentTrack(int currentTrack) {
    _currentTrack = currentTrack;
    notifyListeners();
  }

  resetList() {
    musicList.forEach((musicItem) => musicItem.isPlaying = false);
  }
}

class Music {
  String name;
  String artistName;
  Duration duration;

  bool isPlaying = false;
  Music({
    required this.name,
    required this.artistName,
    this.duration = const Duration(minutes: 0),
    this.isPlaying = false,
  });
}
