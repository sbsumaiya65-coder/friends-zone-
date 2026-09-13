import 'package:flutter/material.dart';
import 'dart:math';
import '../../coin_referral_manager.dart';

class SpinWheelGameScreen extends StatefulWidget {
  const SpinWheelGameScreen({super.key});

  @override
  State<SpinWheelGameScreen> createState() => _SpinWheelGameScreenState();
}

class _SpinWheelGameScreenState extends State<SpinWheelGameScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool isSpinning = false;
  String resultMessage = 'Spin the Lucky Wheel to Win Coins!';

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 2));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _spinWheel() {
    if (isSpinning) return;
    setState(() {
      isSpinning = true;
      resultMessage = 'Spinning... Good Luck!';
    });

    _controller.forward(from: 0).then((_) {
      int wonCoins = [10, 20, 50, 100, 5, 0][Random().nextInt(6)];
      setState(() {
        isSpinning = false;
        if (wonCoins > 0) {
          CoinReferralManager.userCoins += wonCoins;
          resultMessage = '🎉 You won +$wonCoins Coins!';
        } else {
          resultMessage = '😢 Better luck next time!';
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lucky Spin & Win Arena'),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.star, size: 60, color: Colors.amber),
            const SizedBox(height: 10),
            Text(
              resultMessage,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.pink),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            RotationTransition(
              turns: Tween(begin: 0.0, end: 5.0).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut)),
              child: Container(
                width: 220,
                height: 220,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(colors: [Colors.pink.shade400, Colors.purple.shade400]),
                  border: Border.all(color: Colors.white, width: 4),
                  boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 10)],
                ),
                child: const Center(
                  child: Text(
                    'SPIN',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              ),
              onPressed: isSpinning ? null : _spinWheel,
              child: const Text('Spin Now (Free)', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
