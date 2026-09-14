import 'package:flutter/material.dart';

class SmartProximityRadarScreen extends StatelessWidget {
  const SmartProximityRadarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('📡 Smart Proximity Radar'),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.radar, size: 80, color: Colors.pink),
            SizedBox(height: 16),
            Text(
              'Searching nearby FZ users & moods...',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

