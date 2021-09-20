import 'package:flutter/material.dart';
import 'package:flutter_projects/state_mngmnt/using_inherited/login_using_inherited.dart';

import './main_using_inherited.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _themeBloc = ThemeInheritedWidget.of(context)?.themeBloc;
    return Container(
      child: ListView(padding: const EdgeInsets.all(30), children: [
        FittedBox(
          child: Text("Settings"),
        ),
        Divider(thickness: 3),
        SwitchListTile(
          value: _themeBloc!.isDarkMode,
          onChanged: (val) => _themeBloc.onThemeUpdated(val),
          title: Text("Dark Mode"),
        ),
        const SizedBox(height: 200),
        Divider(thickness: 3),
        ListTile(
          title: Text("Log Out"),
          onTap: () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (_) => LoginUsingInherited()),
                (route) => false);
          },
        )
      ]),
    );
  }
}
