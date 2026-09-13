import 'package:flutter/material.dart';
import '../coin_referral_manager.dart';

class VipStoreScreen extends StatefulWidget {
  const VipStoreScreen({super.key});

  @override
  State<VipStoreScreen> createState() => _VipStoreScreenState();
}

class _VipStoreScreenState extends State<VipStoreScreen> {
  final List<Map<String, dynamic>> vipItems = [
    {'name': 'Golden Frame', 'cost': 150, 'icon': Icons.brightness_7},
    {'name': 'Diamond Crown Badge', 'cost': 300, 'icon': Icons.diamond},
    {'name': 'Neon Profile Glow', 'cost': 500, 'icon': Icons.flash_on},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('👑 VIP Badges & Frames Store'),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: vipItems.length,
        itemBuilder: (context, index) {
          final item = vipItems[index];
          return Card(
            elevation: 3,
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: Icon(item['icon'], size: 40, color: Colors.amber),
              title: Text(item['name'], style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('Price: ${item['cost']} Coins'),
              trailing: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.pink, foregroundColor: Colors.white),
                onPressed: () {
                  bool success = CoinReferralManager.spendCoins(item['cost'], context);
                  if (success) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Successfully unlocked ${item['name']}!')),
                    );
                  }
                },
                child: const Text('Buy Now'),
              ),
            ),
          );
        },
      ),
    );
  }
}
