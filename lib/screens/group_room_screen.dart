import 'package:flutter/material.dart';

class GroupRoomScreen extends StatelessWidget {
  const GroupRoomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Voice & Video Rooms')),
      body: ListView.builder(
        itemCount: 3,
        padding: const EdgeInsets.all(12.0),
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              leading: const CircleAvatar(
                backgroundColor: Colors.pink,
                child: Icon(Icons.mic, color: Colors.white),
              ),
              title: Text('Friends Chill Room #${index + 1}'),
              subtitle: const Text('Host: Biplob • 5 speakers active'),
              trailing: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {},
                child: const Text('Join'),
              ),
            ),
          );
        },
      ),
    );
  }
}
