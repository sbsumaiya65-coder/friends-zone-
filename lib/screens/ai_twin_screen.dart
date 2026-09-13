import 'package:flutter/material.dart';

class AiTwinScreen extends StatefulWidget {
  const AiTwinScreen({super.key});

  @override
  State<AiTwinScreen> createState() => _AiTwinScreenState();
}

class _AiTwinScreenState extends State<AiTwinScreen> {
  bool isTwinActive = true;
  String customReplyPrompt = 'Hello! I am Biplob\'s AI Digital Clone. He is currently offline, but I am handling his chat and engagement.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🤖 AI Social Twin Clone'),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.purple.shade50,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.purple.shade200),
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.purple,
                    child: Icon(Icons.smart_toy, size: 35, color: Colors.white),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Your AI Clone is Ready', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.purple)),
                        const SizedBox(height: 4),
                        Text(isTwinActive ? 'Status: Active & Replying' : 'Status: Paused', style: TextStyle(color: isTwinActive ? Colors.green : Colors.grey, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  Switch(
                    value: isTwinActive,
                    activeColor: Colors.purple,
                    onChanged: (val) {
                      setState(() {
                        isTwinActive = val;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(isTwinActive ? 'AI Twin activated!' : 'AI Twin paused.')),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text('Configure Auto-Reply Behavior:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
            const SizedBox(height: 8),
            TextField(
              maxLines: 4,
              controller: TextEditingController(text: customReplyPrompt),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter instructions for how your AI clone should reply to messages...',
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('✨ AI Twin settings updated successfully!')),
                  );
                },
                child: const Text('Save AI Clone Settings', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
