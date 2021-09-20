import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './bloc/theme_bloc.dart';
import './login_using_provider.dart';

class MainUsingProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeBloc(),
      child: Consumer<ThemeBloc>(builder: (context, themeBloc, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: themeBloc.isDarkMode ? ThemeData.dark() : ThemeData.light(),
          home: LoginUsingProvider(),
        );
      }),
    );
  }
}
