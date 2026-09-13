import 'package:flutter/material.dart';

class GroupRoomScreen extends StatelessWidget {
  const GroupRoomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Live Voice & Video Rooms'),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: 4,
        padding: const EdgeInsets.all(12),
        itemBuilder: (context, index) {
          return Card(
            elevation: 3,
            margin: const EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: const CircleAvatar(
                backgroundColor: Colors.purple,
                child: Icon(Icons.mic, color: Colors.white),
              ),
              title: Text('Friends Chill & Talk Room #${index + 1}', style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: const Text('Host: Biplob Hossain • 6 Speakers Active'),
              trailing: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Joined live audio room successfully!')),
                  );
                },
                child: const Text('Join'),
              ),
            ),
          );
        },
      ),
    );
  }
}
