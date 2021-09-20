import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'bloc/counter_bloc.dart';
import 'menu_page.dart';

class HomeUsingProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CounterBloc(),
      child: Consumer<CounterBloc>(builder: (context, counterBloc, _) {
        return Scaffold(
            appBar: AppBar(
              title: Text("Home w/ Provider package"),
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
                        counterBloc.counter.toString(),
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
                        onPressed: counterBloc.decrement,

                        child: Icon(Icons.remove),
                      ),
                      FloatingActionButton(
                        heroTag: null,
                        // key: Key("+"),
                        onPressed: counterBloc.increment,
                        child: Icon(Icons.add),
                      ),
                    ],
                  )
                ],
              ),
            ));
      }),
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
