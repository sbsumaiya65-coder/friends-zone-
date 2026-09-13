import 'package:flutter/material.dart';
import 'dart:math';

class LudoGameScreen extends StatefulWidget {
  const LudoGameScreen({super.key});

  @override
  State<LudoGameScreen> createState() => _LudoGameScreenState();
}

class _LudoGameScreenState extends State<LudoGameScreen> {
  int diceValue = 1;
  bool isRolling = false;

  void _rollDice() {
    setState(() {
      isRolling = true;
    });

    // ডাইস রোলিং অ্যানিমেশন ইফেক্ট
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        diceValue = Random().nextInt(6) + 1;
        isRolling = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Friends Zone - Ludo Mini Arena'),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.casino, size: 80, color: Colors.pink),
            const SizedBox(height: 20),
            const Text(
              'Roll the Dice & Move Your Token!',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.pink.shade50,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.pink, width: 2),
              ),
              child: Text(
                isRolling ? '...' : '$diceValue',
                style: const TextStyle(fontSize: 60, fontWeight: FontWeight.bold, color: Colors.pink),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton.styleFrom(
              backgroundColor: Colors.pink,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
            ).wrap(
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                ),
                onPressed: isRolling ? null : _rollDice,
                child: const Text('Roll Dice 🎲', style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

extension on ButtonStyle {
  Widget wrap(Widget child) => child;
}
