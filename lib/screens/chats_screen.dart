import 'package:flutter/material.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> chatList = [
      {'name': 'Tanvir Ahmed', 'msg': 'Hey Biplob, are you near the radar?', 'time': '10:45 AM'},
      {'name': 'Nusrat Jahan', 'msg': 'Check out my new post in Zone Feed!', 'time': '09:30 AM'},
      {'name': 'Rahim Chowdhury', 'msg': 'Let\'s play Tic Tac Toe now.', 'time': 'Yesterday'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Messages & Chats'),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: chatList.length,
        itemBuilder: (context, index) {
          final chat = chatList[index];
          return ListTile(
            leading: const CircleAvatar(
              backgroundColor: Colors.pinkAccent,
              child: Icon(Icons.person, color: Colors.white),
            ),
            title: Text(chat['name']!, style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(chat['msg']!, maxLines: 1, overflow: TextOverflow.ellipsis),
            trailing: Text(chat['time']!, style: const TextStyle(color: Colors.grey, fontSize: 11)),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Opening chat with ${chat['name']}...')),
              );
            },
          );
        },
      ),
    );
  }
}
