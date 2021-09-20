import 'package:flutter/material.dart';

import './bloc/theme_bloc.dart';
import './login_using_inherited.dart';

class MainUsingInherited extends StatelessWidget {
  final _themeBloc = ThemeBloc();

  @override
  Widget build(BuildContext context) {
    return ThemeInheritedWidget(
      themeBloc: _themeBloc,
      child: AnimatedBuilder(
        animation: _themeBloc,
        builder: (context, _) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: _themeBloc.isDarkMode ? ThemeData.dark() : ThemeData.light(),
          home: LoginUsingInherited(),
        ),
      ),
    );
  }
}

// The KEY of all this
class ThemeInheritedWidget extends InheritedWidget {
  ThemeInheritedWidget({
    Key? key,
    required this.child,
    required this.themeBloc,
  }) : super(key: key, child: child);

  final Widget child;
  final ThemeBloc themeBloc;

  static ThemeInheritedWidget? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<ThemeInheritedWidget>();

  @override
  bool updateShouldNotify(ThemeInheritedWidget oldWidget) => true;
}
