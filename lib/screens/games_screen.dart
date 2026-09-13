import 'package:flutter/material.dart';
import 'tictactoe_screen.dart';
import 'ludo_game_screen.dart';

class GamesScreen extends StatelessWidget {
  const GamesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gaming Zone'),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Card(
              color: Colors.pink.shade50,
              child: ListTile(
                leading: const Icon(Icons.grid_3x3, size: 40, color: Colors.pink),
                title: const Text('Tic Tac Toe', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                subtitle: const Text('Classic X & O with auto-reset & winning animation.'),
                trailing: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.pink, foregroundColor: Colors.white),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const TicTacToeScreen()));
                  },
                  child: const Text('Play'),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Card(
              color: Colors.purple.shade50,
              child: ListTile(
                leading: const Icon(Icons.casino, size: 40, color: Colors.purple),
                title: const Text('Ludo Mini Arena', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                subtitle: const Text('Roll dice and play with nearby friends.'),
                trailing: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.purple, foregroundColor: Colors.white),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const LudoGameScreen()));
                  },
                  child: const Text('Play'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
