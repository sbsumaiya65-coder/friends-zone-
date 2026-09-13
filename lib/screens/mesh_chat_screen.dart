import 'package:flutter/material.dart';

class MeshChatScreen extends StatefulWidget {
  const MeshChatScreen({super.key});

  @override
  State<MeshChatScreen> createState() => _MeshChatScreenState();
}

class _MeshChatScreenState extends State<MeshChatScreen> {
  final TextEditingController _msgController = TextEditingController();
  final List<Map<String, String>> meshMessages = [
    {'sender': 'Nearby Node #1', 'text': 'Hey! Anyone connected via mesh offline?', 'time': 'Just now'},
    {'sender': 'Biplob (You)', 'text': 'Yes! Mesh chain is active without internet.', 'time': '1 min ago'},
  ];

  void _sendMeshMessage() {
    if (_msgController.text.isNotEmpty) {
      setState(() {
        meshMessages.add({
          'sender': 'Biplob (You)',
          'text': _msgController.text,
          'time': 'Just now',
        });
        _msgController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('📶 Offline Mesh Bluetooth Chat'),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            color: Colors.amber.shade50,
            child: const Row(
              children: [
                Icon(Icons.bluetooth_connected, color: Colors.blue),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Connected via Peer-to-Peer Bluetooth & Wi-Fi Direct Mesh Chain. Zero Internet Required!',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.brown),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: meshMessages.length,
              itemBuilder: (context, index) {
                final msg = meshMessages[index];
                bool isMe = msg['sender']!.contains('You');
                return Align(
                  alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: isMe ? Colors.pink.shade100 : Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(msg['sender']!, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11, color: isMe ? Colors.pink.shade900 : Colors.grey.shade700)),
                        const SizedBox(height: 4),
                        Text(msg['text']!, style: const TextStyle(fontSize: 15)),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _msgController,
                    decoration: const InputDecoration(
                      hintText: 'Type offline mesh message...',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  onPressed: _sendMeshMessage,
                  icon: const Icon(Icons.send, color: Colors.pink),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
