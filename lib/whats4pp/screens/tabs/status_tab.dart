import 'package:flutter/material.dart';

import '../../models/status_model.dart';

class StatusTab extends StatefulWidget {
  @override
  _StatusTabState createState() => _StatusTabState();
}

class _StatusTabState extends State<StatusTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: CircleAvatar(
              foregroundColor: Theme.of(context).accentColor,
              backgroundColor: Colors.grey,
              backgroundImage: NetworkImage(
                  "https://avatars.githubusercontent.com/u/52813517?s=400&u=ffdb04d74ae1f757977ea5dc82bdd3a2f7542b26&v=4"),
            ),
            title: Text(
              "My Status",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text("Tap to add status update"),
          ),
          Text("Recent updates",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor)),
          ListTile(
            leading: CircleAvatar(
              foregroundColor: Theme.of(context).accentColor,
              backgroundColor: Colors.grey,
              backgroundImage: NetworkImage(status[1].imgUrl),
            ),
            title: Text(
              status[1].name,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text("Añadir a mi estado"),
          ),
          Divider(),
          ListTile(
            leading: CircleAvatar(
              foregroundColor: Theme.of(context).accentColor,
              backgroundColor: Colors.grey,
              backgroundImage: NetworkImage(status[0].imgUrl),
            ),
            title: Text(
              status[0].name,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text("Añadir a mi estado"),
          ),
        ],
      ),
    );
  }
}
