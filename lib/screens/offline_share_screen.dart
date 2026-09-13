import 'package:flutter/material.dart';

class OfflineShareScreen extends StatefulWidget {
  const OfflineShareScreen({super.key});

  @override
  State<OfflineShareScreen> createState() => _OfflineShareScreenState();
}

class _OfflineShareScreenState extends State<OfflineShareScreen> {
  bool isSending = false;
  bool isReceiving = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Offline File Sharing (SHAREit/Sappa Style)'),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Share Audio, Video Songs & Files Offline via Bluetooth & Local Wi-Fi',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            
            // সেন্ড এবং রিসিভ বাটন
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  ),
                  onPressed: () {
                    setState(() {
                      isSending = true;
                      isReceiving = false;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Opening local storage to select audio/video to send...')),
                    );
                  },
                  icon: const Icon(Icons.send),
                  label: const Text('Send Files'),
                ),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  ),
                  onPressed: () {
                    setState(() {
                      isReceiving = true;
                      isSending = false;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Listening for nearby sender devices...')),
                    );
                  },
                  icon: const Icon(Icons.call_received),
                  label: const Text('Receive Files'),
                ),
              ],
            ),
            const SizedBox(height: 40),
            
            // কানেক্টিভিটি স্ট্যাটাস বক্স
            if (isSending || isReceiving)
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.pink.shade50,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.pink.shade200),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CircularProgressIndicator(color: Colors.pink),
                      const SizedBox(height: 20),
                      Text(
                        isSending ? 'Searching for nearby receiver device...' : 'Waiting for sender connection...',
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Bluetooth & Local Wi-Fi hotspot active for high-speed offline transfer.',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              )
            else
              const Expanded(
                child: Center(
                  child: Text(
                    'Select "Send" or "Receive" above to start sharing music, videos, and documents without internet connection!',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
