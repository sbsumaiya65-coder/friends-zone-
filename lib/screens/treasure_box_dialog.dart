import 'package:flutter/material.dart';
import '../coin_referral_manager.dart';

class TreasureBoxDialog extends StatelessWidget {
  const TreasureBoxDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Row(
        children: [
          Icon(Icons.card_giftcard, color: Colors.amber),
          SizedBox(width: 8),
          Text('Treasure Box 🎁'),
        ],
      ),
      content: const Text(
        'A Lucky Red Packet has been dropped in the room! Open it quickly to grab free bonus coins.',
        style: TextStyle(fontSize: 15),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Close', style: TextStyle(color: Colors.grey)),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.amber.shade700, foregroundColor: Colors.white),
          onPressed: () {
            CoinReferralManager.userCoins += 50; // লাকি বক্স থেকে ৫০ কয়েন বোনাস
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('🎉 Congratulations! You opened the Treasure Box and won +50 Coins!')),
            );
          },
          child: const Text('Open Box Now'),
        ),
      ],
    );
  }
}
