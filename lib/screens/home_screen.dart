import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Friends Zone Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.games),
            onPressed: () {
              Navigator.pushNamed(context, '/tictactoe');
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Card(
            color: Colors.pink.shade50,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Welcome to Friends Zone!', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.pink)),
                  SizedBox(height: 8),
                  Text('Connect with new friends, play games, and share your moments.'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.pink, foregroundColor: Colors.white),
            icon: const Icon(Icons.videogame_asset),
            label: const Text('Play Tic Tac Toe Game'),
            onPressed: () {
              Navigator.pushNamed(context, '/tictactoe');
            },
          ),
        ],
      ),
    );
  }
}
