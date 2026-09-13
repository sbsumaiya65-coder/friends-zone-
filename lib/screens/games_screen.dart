import 'package:flutter/material.dart';

class GamesScreen extends StatelessWidget {
  const GamesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gaming Zone')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              color: Colors.pink.shade50,
              child: ListTile(
                leading: const Icon(Icons.games, size: 40, color: Colors.pink),
                title: const Text('Tic Tac Toe', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                subtitle: const Text('Play classic X and O game with friends.'),
                trailing: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.pink, foregroundColor: Colors.white),
                  onPressed: () {
                    Navigator.pushNamed(context, '/tictactoe');
                  },
                  child: const Text('Play Now'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
