import 'package:flutter/material.dart';

class PremiumHubScreen extends StatelessWidget {
  const PremiumHubScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FZ Pro & Premium Hub'),
        backgroundColor: const Color(0xFF1E1E30),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.pink[50],
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.pink, width: 1.5),
              ),
              child: Column(
                children: const [
                  Icon(Icons.star, size: 50, color: Colors.pink),
                  SizedBox(height: 10),
                  Text(
                    'Upgrade to FZ Pro',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.pink),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Unlock exclusive features, badges, and VIP privileges!',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1E1E30),
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              onPressed: () {},
              child: const Text('Subscribe Now', style: TextStyle(fontSize: 16, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
