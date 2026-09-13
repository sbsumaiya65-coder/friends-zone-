import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Friends Zone Home'),
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
                color: Colors.pink.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.pink.shade200),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome to Friends Zone!',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.pink),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Explore nearby radar users, share posts, earn coins, and play games offline or online.',
                    style: TextStyle(color: Colors.black87),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text('Quick Shortcuts:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                children: [
                  _buildShortcutCard(context, 'Tic Tac Toe Game', Icons.games, () {
                    Navigator.pushNamed(context, '/tictactoe');
                  }),
                  _buildShortcutCard(context, 'Live Rooms', Icons.mic, () {
                    // Navigate to Room or Tab
                  }),
                  _buildShortcutCard(context, 'Nearby Radar', Icons.radar, () {
                    // Navigate to Discover
                  }),
                  _buildShortcutCard(context, 'Premium Store', Icons.store, () {
                    // Navigate to Profile
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildShortcutCard(BuildContext context, String title, IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.pink),
            const SizedBox(height: 10),
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
