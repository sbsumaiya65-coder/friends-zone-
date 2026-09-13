import 'package:flutter/material.dart';

class TimeCapsuleScreen extends StatefulWidget {
  const TimeCapsuleScreen({super.key});

  @override
  State<TimeCapsuleScreen> createState() => _TimeCapsuleScreenState();
}

class _TimeCapsuleScreenState extends State<TimeCapsuleScreen> {
  final TextEditingController _messageController = TextEditingController();

  final List<Map<String, String>> discoveredCapsules = [
    {'location': 'Ishwardi Railway Junction', 'message': 'Secret memory left by Biplob: Beautiful sunset at Hardinge Bridge! 🌅', 'distance': '50m away'},
    {'location': 'City Park Cafe', 'message': 'Secret voice note: Best coffee in town! ☕', 'distance': '120m away'},
  ];

  void _dropCapsule() {
    if (_messageController.text.isNotEmpty) {
      setState(() {
        discoveredCapsules.insert(0, {
          'location': 'Current GPS Location (Pinned)',
          'message': _messageController.text,
          'distance': '0m away (Yours)',
        });
        _messageController.clear();
      });
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('📍 Proximity Time Capsule successfully locked at your GPS location!')),
      );
    }
  }

  void _showDropDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Drop Proximity Time Capsule'),
          content: TextField(
            controller: _messageController,
            maxLines: 3,
            decoration: const InputDecoration(
              hintText: 'Write a secret message or memory for people visiting this spot...',
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel', style: TextStyle(color: Colors.grey)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.pink, foregroundColor: Colors.white),
              onPressed: _dropCapsule,
              child: const Text('Lock & Drop'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('📍 Proximity Time Capsules'),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: discoveredCapsules.length,
        itemBuilder: (context, index) {
          final capsule = discoveredCapsules[index];
          return Card(
            elevation: 3,
            margin: const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: const CircleAvatar(
                backgroundColor: Colors.amber,
                child: Icon(Icons.lock_open, color: Colors.white),
              ),
              title: Text(capsule['location']!, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),
                  Text(capsule['message']!, style: const TextStyle(color: Colors.black87)),
                  const SizedBox(height: 4),
                  Text(capsule['distance']!, style: const TextStyle(color: Colors.green, fontSize: 11)),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
        onPressed: _showDropDialog,
        icon: const Icon(Icons.add_location),
        label: const Text('Drop Capsule'),
      ),
    );
  }
}
