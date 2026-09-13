import 'package:flutter/material.dart';

class TicTacToeScreen extends StatefulWidget {
  const TicTacToeScreen({super.key});

  @override
  State<TicTacToeScreen> createState() => _TicTacToeScreenState();
}

class _TicTacToeScreenState extends State<TicTacToeScreen> {
  List<String> board = List.filled(9, '');
  bool xTurn = true;
  String winner = '';

  void _onTap(int index) {
    if (board[index] == '' && winner == '') {
      setState(() {
        board[index] = xTurn ? 'X' : 'O';
        xTurn = !xTurn;
        _checkWinner();
      });
    }
  }

  void _checkWinner() {
    List<List<int>> winningList = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8], // Rows
      [0, 3, 6], [1, 4, 7], [2, 5, 8], // Columns
      [0, 4, 8], [2, 4, 6]             // Diagonals
    ];

    for (var list in winningList) {
      String a = board[list[0]];
      String b = board[list[1]];
      String c = board[list[2]];

      if (a != '' && a == b && b == c) {
        setState(() {
          winner = '$a Wins!';
        });
      }
    }

    if (winner == '' && !board.contains('')) {
      setState(() {
        winner = 'It\'s a Draw!';
      });
    }
  }

  void _resetGame() {
    setState(() {
      board = List.filled(9, '');
      xTurn = true;
      winner = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tic Tac Toe Game')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(winner.isEmpty ? (xTurn ? 'Player X Turn' : 'Player O Turn') : winner,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.pink)),
          const SizedBox(height: 20),
          SizedBox(
            height: 350,
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: 9,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => _onTap(index),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.pink.shade50,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.pink, width: 2),
                    ),
                    child: Center(
                      child: Text(
                        board[index],
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: board[index] == 'X' ? Colors.pink : Colors.blue,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.pink, foregroundColor: Colors.white),
            onPressed: _resetGame,
            child: const Text('Restart Game'),
          ),
        ],
      ),
    );
  }
}
