import 'package:flutter/material.dart';
import '../../models/chat_model.dart';
//import '../../models/status_model.dart';

import '../chat_screen.dart';

class ChatsTab extends StatefulWidget {
  const ChatsTab({Key? key}) : super(key: key);

  @override
  _ChatsTabState createState() => _ChatsTabState();
}

class _ChatsTabState extends State<ChatsTab> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: messageData.length,
        itemBuilder: (context, index) => Column(
              children: [
                if (index > 0) Divider(height: 12.0),
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(messageData[index].imageUrl),
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        messageData[index].name,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        messageData[index].time,
                        style: TextStyle(color: Colors.grey, fontSize: 15.0),
                      )
                    ],
                  ),
                  subtitle: Container(
                    padding: const EdgeInsets.only(top: 6.0),
                    child: Text(
                      messageData[index].message,
                      style: TextStyle(color: Colors.grey, fontSize: 15.0),
                    ),
                  ),
                  onTap: () {
                    var route = MaterialPageRoute(
                        builder: (BuildContext context) => ChatScreen(
                              name: messageData[index].name,
                            ));
                    Navigator.of(context).push(route);
                  },
                ),
              ],
            ));
  }
}
