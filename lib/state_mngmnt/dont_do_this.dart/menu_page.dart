import 'package:flutter/material.dart';

import 'login_dont_do_this.dart';
import 'main_dont_do_this.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key, required this.onThemeSelected}) : super(key: key);
  final ValueChanged<bool> onThemeSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(padding: const EdgeInsets.all(30), children: [
        FittedBox(
          child: Text("Settings"),
        ),
        Divider(thickness: 3),
        SwitchListTile(
          value: darkMode,
          onChanged: (val) => onThemeSelected(val),
          title: Text("Dark Mode"),
        ),
        const SizedBox(height: 200),
        Divider(thickness: 3),
        ListTile(
          title: Text("Log Out"),
          onTap: () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (_) =>
                        LoginDontDoThis(onThemeSelected: onThemeSelected)),
                (route) => false);
          },
        )
      ]),
    );
  }
}
