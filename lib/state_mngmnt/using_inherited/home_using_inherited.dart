import 'package:flutter/material.dart';

import 'bloc/counter_bloc.dart';
import 'menu_page.dart';

class HomeUsingInherited extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _counterBloc = CounterBloc();

    return CounterInheritedWidget(
      counterBloc: _counterBloc,
      child: AnimatedBuilder(
        animation: _counterBloc,
        builder: (context, _) => Scaffold(
            appBar: AppBar(
              title: Text("Home w/ setState"),
            ),
            drawer: Drawer(
              child: MenuPage(),
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
                        _counterBloc.counter.toString(),
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
                        onPressed: _counterBloc.decrement,

                        child: Icon(Icons.remove),
                      ),
                      FloatingActionButton(
                        heroTag: null,
                        // key: Key("+"),
                        onPressed: _counterBloc.increment,
                        child: Icon(Icons.add),
                      ),
                    ],
                  )
                ],
              ),
            )),
      ),
    );
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

class CounterInheritedWidget extends InheritedWidget {
  CounterInheritedWidget(
      {Key? key, required this.child, required this.counterBloc})
      : super(key: key, child: child);

  final Widget child;
  final CounterBloc counterBloc;

  static CounterInheritedWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CounterInheritedWidget>();
  }

  @override
  bool updateShouldNotify(CounterInheritedWidget oldWidget) {
    return true;
  }
}
