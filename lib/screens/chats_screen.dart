import 'package:flutter/material.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Text('FZ Chats & Messages', style: TextStyle(color: Colors.white)),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const CircleAvatar(
              backgroundColor: Colors.pinkAccent,
              child: Icon(Icons.person, color: Colors.white),
            ),
            title: Text('Friend ${index + 1}', style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: const Text('Hey! Check out my new post...'),
            trailing: const Text('10:45 AM', style: TextStyle(color: Colors.grey, fontSize: 12)),
            onTap: () {
              // TODO: Open Chat Room Screen
            },
          );
        },
      ),
    );
  }
}
