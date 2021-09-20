import 'package:flutter/material.dart';

import 'menu_page.dart';

class HomeDontDoThis extends StatefulWidget {
  final ValueChanged<bool> onThemeSelected;

  const HomeDontDoThis({Key? key, required this.onThemeSelected})
      : super(key: key);

  @override
  _HomeDontDoThisState createState() => _HomeDontDoThisState();
}

class _HomeDontDoThisState extends State<HomeDontDoThis> {
  int counter = 0;
  void _increment() {
    setState(() {
      counter++;
    });
  }

  void _decrement() {
    setState(() {
      counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home w/ setState"),
        ),
        drawer: Drawer(
          child: MenuPage(onThemeSelected: widget.onThemeSelected),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              ClipPath(
                clipper: TriangleClipper(),
                child: Container(
                  height: 300,
                  width: 300,
                  padding: EdgeInsets.only(top: 54),
                  color: Colors.blue,
                  child: Text(
                    counter.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 90, color: Colors.white),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FloatingActionButton(
                    heroTag: null,
                    // key: Key("-"),
                    onPressed: _decrement,

                    child: Icon(Icons.remove),
                  ),
                  FloatingActionButton(
                    heroTag: null,
                    // key: Key("+"),
                    onPressed: _increment,
                    child: Icon(Icons.add),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}

class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..lineTo(0, 0)
      ..lineTo(size.width * .5, size.height)
      ..lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
