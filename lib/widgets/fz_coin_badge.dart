import 'package:flutter/material.dart';

class FZCoinBadge extends StatelessWidget {
  final int coinAmount;
  final double fontSize;

  const FZCoinBadge({
    super.key,
    required this.coinAmount,
    this.fontSize = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.amber.shade100,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.amber.shade700, width: 1.5),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // প্রিমিয়াম গোল্ডেন সার্কেলের ভেতর 'FZ' লোগো
          Container(
            width: 22,
            height: 22,
            decoration: const BoxDecoration(
              color: Colors.pink,
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Text(
                '𝗙𝗭',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 6),
          Text(
            '$coinAmount',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: fontSize,
              color: Colors.brown.shade900,
            ),
          ),
        ],
      ),
    );
  }
}
