import 'package:flutter/material.dart';
import '../tictactoe_screen.dart';
import '../ludo_game_screen.dart';
import 'spin_wheel_game.dart';

class GamesHubScreen extends StatelessWidget {
  const GamesHubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🎮 Premium Game Zone Hub'),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 14,
          mainAxisSpacing: 14,
          children: [
            _buildGameCard(context, 'Tic Tac Toe', Icons.grid_3x3, Colors.pink, () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const TicTacToeScreen()));
            }),
            _buildGameCard(context, 'Ludo Arena', Icons.casino, Colors.purple, () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const LudoGameScreen()));
            }),
            _buildGameCard(context, 'Lucky Spin', Icons.star, Colors.amber, () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const SpinWheelGameScreen()));
            }),
            _buildGameCard(context, 'Card Match', Icons.style, Colors.blue, () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Card Matching game launching soon inside group voice calls!')),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildGameCard(BuildContext context, String title, IconData icon, Color color, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color, width: 2),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: color),
            const SizedBox(height: 12),
            Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: color),
            ),
            const SizedBox(height: 4),
            const Text('Play & Earn Coins', style: TextStyle(fontSize: 11, color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
