import 'package:flutter/material.dart';

import 'home_dont_do_this.dart';

// Login page
class LoginDontDoThis extends StatelessWidget {
  final ValueChanged<bool> onThemeSelected;

  const LoginDontDoThis({Key? key, required this.onThemeSelected})
      : super(key: key);

  void _onTap(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (_) => HomeDontDoThis(onThemeSelected: onThemeSelected)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Login"),
        ),
        body: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                TextField(decoration: InputDecoration(hintText: "Username")),
                TextField(
                    obscureText: true,
                    decoration: InputDecoration(hintText: "Password")),
                SizedBox(height: 30),
                ElevatedButton(
                  child: Text("Login"),
                  onPressed: () => _onTap(context),
                ),
              ],
            )));
  }
}
