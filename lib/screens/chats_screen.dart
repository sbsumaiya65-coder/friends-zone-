import 'package:flutter/material.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Conversations')),
      body: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const CircleAvatar(
              backgroundColor: Colors.pinkAccent,
              child: Icon(Icons.chat_bubble, color: Colors.white),
            ),
            title: Text('Friend Name ${index + 1}'),
            subtitle: Text('Hello! How are you doing today?'),
            trailing: const Text('10:45 AM', style: TextStyle(color: Colors.grey, fontSize: 12)),
            onTap: () {
              // Chat conversation tap action
            },
          );
        },
      ),
    );
  }
}
