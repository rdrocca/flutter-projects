import 'package:flutter/material.dart';

import 'fractal_tree.dart';

class HomeFractalTree extends StatelessWidget {
  const HomeFractalTree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Fractal Tree")),
      body: Center(child: FractalTree()),
    );
  }
}
