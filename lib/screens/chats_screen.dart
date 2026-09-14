import 'package:flutter/material.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chats & Messages'),
        backgroundColor: const Color(0xFF1E1E30),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.pink[200],
              child: const Icon(Icons.person, color: Colors.white),
            ),
            title: Text('Friend Name $index'),
            subtitle: const Text('Hello! How are you doing?'),
            trailing: const Text('12:30 PM', style: TextStyle(fontSize: 12, color: Colors.grey)),
            onTap: () {},
          );
        },
      ),
    );
  }
}
