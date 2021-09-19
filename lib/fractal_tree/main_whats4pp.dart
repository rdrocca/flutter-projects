import 'package:flutter/material.dart';

import './home_fractal_tree.dart';

class MainFractalTree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'FractalTree',
      debugShowCheckedModeBanner: false,

      home: HomeFractalTree(),
    );
  }
}
