import 'package:flutter/material.dart';
import 'package:flutter_projects/state_mngmnt/using_provider.dart/bloc/theme_bloc.dart';
import 'package:provider/provider.dart';

import 'login_using_provider.dart';
import 'main_using_provider.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _themeBloc = Provider.of<ThemeBloc>(context, listen: false);
    return Container(
      child: ListView(padding: const EdgeInsets.all(30), children: [
        FittedBox(
          child: Text("Settings"),
        ),
        Divider(thickness: 3),
        SwitchListTile(
          value: _themeBloc.isDarkMode,
          onChanged: (val) => _themeBloc.onThemeUpdated(val),
          title: Text("Dark Mode"),
        ),
        const SizedBox(height: 200),
        Divider(thickness: 3),
        ListTile(
          title: Text("Log Out"),
          onTap: () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (_) => LoginUsingProvider()),
                (route) => false);
          },
        )
      ]),
    );
  }
}
