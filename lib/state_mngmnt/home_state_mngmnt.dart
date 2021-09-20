import 'package:flutter/material.dart';

import './dont_do_this.dart/main_dont_do_this.dart';
import './using_inherited/main_using_inherited.dart';
import './using_provider.dart/main_using_provider.dart';

class HomeStateMngmnt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    onButtonTap(Widget page) {
      Navigator.push(
          context, MaterialPageRoute(builder: (BuildContext context) => page));
    }

    return Scaffold(
        appBar: AppBar(
          title: Text("Flutter Projects"),
        ),
        body: Padding(
          padding: EdgeInsets.all(15.0),
          child: ListView(children: <Widget>[
            MaterialButton(
              child: Text("Don't do this!"),
              onPressed: () {
                onButtonTap(
                  MainDontDoThis(),
                );
              },
            ),
            MaterialButton(
              child: Text("Using Inherited Widget!"),
              onPressed: () {
                onButtonTap(
                  MainUsingInherited(),
                );
              },
            ),
            MaterialButton(
              child: Text("Using Provider package!"),
              onPressed: () {
                onButtonTap(
                  MainUsingProvider(),
                );
              },
            )
          ]),
        ));
  }
}
