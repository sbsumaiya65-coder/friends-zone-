import 'package:flutter/material.dart';

class TicTacToeScreen extends StatefulWidget {
  const TicTacToeScreen({super.key});

  @override
  State<TicTacToeScreen> createState() => _TicTacToeScreenState();
}

class _TicTacToeScreenState extends State<TicTacToeScreen> with SingleTickerProviderStateMixin {
  List<String> board = List.filled(9, '');
  bool xTurn = true;
  String winner = '';
  int xScore = 0;
  int oScore = 0;
  bool isAnimating = false;

  late AnimationController _animController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _scaleAnimation = CurvedAnimation(parent: _animController, curve: Curves.elasticOut);
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  void _played(int index) {
    if (board[index] != '' || winner != '') return;

    setState(() {
      board[index] = xTurn ? 'X' : 'O';
      xTurn = !xTurn;
      _checkWinner();
    });
  }

  void _checkWinner() {
    const List<List<int>> conditions = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8], // Rows
      [0, 3, 6], [1, 4, 7], [2, 5, 8], // Columns
      [0, 4, 8], [2, 4, 6],           // Diagonals
    ];

    for (var c in conditions) {
      String p0 = board[c[0]];
      String p1 = board[c[1]];
      String p2 = board[c[2]];

      if (p0 != '' && p0 == p1 && p0 == p2) {
        setState(() {
          winner = '$p0 Wins!';
          if (p0 == 'X') {
            xScore++;
          } else {
            oScore++;
          }
          isAnimating = true;
        });
        _animController.forward(from: 0.0);

        // উইনিং অ্যানিমেশন দেখানোর পর ৩ সেকেন্ডের মধ্যে অটো রিসেট
        Future.delayed(const Duration(seconds: 3), () {
          if (mounted) {
            _resetBoard();
          }
        });
        return;
      }
    }

    if (!board.contains('') && winner == '') {
      setState(() {
        winner = 'It\'s a Draw!';
      });
      Future.delayed(const Duration(seconds: 2), () {
        if (mounted) {
          _resetBoard();
        }
      });
    }
  }

  void _resetBoard() {
    setState(() {
      board = List.filled(9, '');
      winner = '';
      xTurn = true;
      isAnimating = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tic Tac Toe - Auto Reset & FX'),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('Player X: $xScore', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.pink)),
              Text('Player O: $oScore', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.purple)),
            ],
          ),
          const SizedBox(height: 20),
          
          // উইনিং অ্যানিমেশন টেক্সট পপআপ
          if (winner.isNotEmpty)
            ScaleTransition(
              scale: _scaleAnimation,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.pink.shade100,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.pink, width: 2),
                ),
                child: Text(
                  winner,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.pink),
                ),
              ),
            )
          else
            Text(
              xTurn ? 'Turn: Player X' : 'Turn: Player O',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            
          const SizedBox(height: 20),
          SizedBox(
            height: 350,
            width: 350,
            child: GridView.builder(
              itemCount: 9,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 6,
                mainAxisSpacing: 6,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => _played(index),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.pink.shade50,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.pink.shade200, width: 2),
                    ),
                    child: Center(
                      child: Text(
                        board[index],
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: board[index] == 'X' ? Colors.pink : Colors.purple,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
