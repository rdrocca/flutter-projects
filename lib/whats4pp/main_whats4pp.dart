import 'package:flutter/material.dart';

import './home_whats4pp.dart';

class MainWhats4pp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Whats4pp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xff075E54),
        // accentColor: Color(0xff25D366),
        colorScheme: ColorScheme.fromSwatch(accentColor: Color(0xff25D366)),
      ),
      home: HomeWhats4pp(),
    );
  }
}
