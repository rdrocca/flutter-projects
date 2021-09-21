import 'package:flutter/material.dart';

import 'home_snake_game.dart';

class MainSnakeGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Whats4pp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xff075E54),
        accentColor: Color(0xff25D366),
      ),
      home: HomeSnakeGame(),
    );
  }
}
