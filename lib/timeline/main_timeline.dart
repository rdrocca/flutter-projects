import 'package:flutter/material.dart';
import './timeline_widget.dart';

// import 'package:google_fonts/google_fonts.dart';

// Flutter Clubhouse Clone UI Tutorial | Apps From Scratch - https://youtu.be/vyQq7H_q4nQ
class MainTimeline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TimelineWidget(),
    );
  }
}
