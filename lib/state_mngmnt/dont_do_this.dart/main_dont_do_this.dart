import 'package:flutter/material.dart';

import 'login_dont_do_this.dart';

bool darkMode = false;

class MainDontDoThis extends StatefulWidget {
  @override
  _MainDontDoThisState createState() => _MainDontDoThisState();
}

class _MainDontDoThisState extends State<MainDontDoThis> {
  void onThemeUpdated(bool isDark) {
    setState(() {
      darkMode = isDark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Whats4pp',
      debugShowCheckedModeBanner: false,
      theme: darkMode ? ThemeData.dark() : ThemeData.light(),
      home: LoginDontDoThis(onThemeSelected: onThemeUpdated),
    );
  }
}
