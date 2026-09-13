import 'package:flutter/material.dart';

class VoiceChangerScreen extends StatefulWidget {
  const VoiceChangerScreen({super.key});

  @override
  State<VoiceChangerScreen> createState() => _VoiceChangerScreenState();
}

class _VoiceChangerScreenState extends State<VoiceChangerScreen> {
  String selectedVoice = 'Normal';

  final List<String> voiceModes = ['Normal', 'Robot 🤖', 'Child 👶', 'Monster 👹', 'Echo 🎤'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🎤 Magic Voice Changer'),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Select a voice effect to change your sound during group calls:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: voiceModes.length,
                itemBuilder: (context, index) {
                  final mode = voiceModes[index];
                  bool isSelected = selectedVoice == mode;
                  return Card(
                    color: isSelected ? Colors.pink.shade100 : Colors.white,
                    child: ListTile(
                      title: Text(mode, style: TextStyle(fontWeight: FontWeight.bold, color: isSelected ? Colors.pink.shade900 : Colors.black)),
                      trailing: isSelected ? const Icon(Icons.check_circle, color: Colors.pink) : null,
                      onTap: () {
                        setState(() {
                          selectedVoice = mode;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Voice mode changed to $mode')),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
