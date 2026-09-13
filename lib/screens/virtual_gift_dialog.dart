import 'package:flutter/material.dart';
import '../coin_referral_manager.dart';

class VirtualGiftDialog extends StatelessWidget {
  const VirtualGiftDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> gifts = [
      {'name': '🌹 Rose', 'cost': 10},
      {'name': '💎 Diamond', 'cost': 50},
      {'name': '🚗 Sports Car', 'cost': 200},
      {'name': '👑 Crown', 'cost': 500},
    ];

    return AlertDialog(
      title: const Text('Send Virtual Gift 🎁'),
      content: SizedBox(
        width: double.maxFinite,
        child: GridView.builder(
          shrinkWrap: true,
          itemCount: gifts.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            final gift = gifts[index];
            return InkWell(
              onTap: () {
                bool success = CoinReferralManager.spendCoins(gift['cost'], context);
                if (success) {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Successfully sent ${gift['name']}!')),
                  );
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.pink.shade50,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.pink.shade200),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(gift['name'], style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 6),
                    Text('${gift['cost']} Coins', style: const TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel', style: TextStyle(color: Colors.pink)),
        ),
      ],
    );
  }
}
