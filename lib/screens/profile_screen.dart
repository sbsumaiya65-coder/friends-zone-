import 'package:flutter/material.dart';
import '../coin_referral_manager.dart';
import '../widgets/fz_coin_badge.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('👤 My FZ Profile & Wallet'),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
      ],
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // প্রফাইল কার্ড
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.pink.shade400, Colors.purple.shade500],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 50, color: Colors.pink),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Biplob Hossain Billal',
                  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Ishwardi, Pabna • VIP Creator',
                  style: TextStyle(color: Colors.white70, fontSize: 12),
                ),
                const SizedBox(height: 16),
                // কয়েন ব্যালেন্স শো করার উইজেট
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.monetization_on, color: Colors.amber),
                      const SizedBox(width: 8),
                      Text(
                        'Balance: ${CoinReferralManager.userCoins} 𝗙𝗭',
                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // ফ্রি কয়েন অর্জনের অপশন
          const Text(
            'Earn Free FZ Coins:',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          ListTile(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            tileColor: Colors.pink.shade50,
            leading: const Icon(Icons.card_giftcard, color: Colors.pink),
            title: const Text('Daily Check-in Bonus', style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: const Text('Claim +20 FZ Coins daily'),
            trailing: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.pink, foregroundColor: Colors.white),
              onPressed: () {
                setState(() {
                  CoinReferralManager.userCoins += 20;
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('🎉 Claimed +20 FZ Coins successfully!')),
                );
              },
              child: const Text('Claim'),
            ),
          ),
          const SizedBox(height: 12),
          ListTile(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            tileColor: Colors.purple.shade50,
            leading: const Icon(Icons.share, color: Colors.purple),
            title: const Text('Refer Friends', style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: const Text('Earn +50 FZ Coins per invite'),
            trailing: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.purple, foregroundColor: Colors.white),
              onPressed: () {
                setState(() {
                  CoinReferralManager.userCoins += 50;
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('🚀 Referral bonus +50 FZ Coins added!')),
                );
              },
              child: const Text('Invite'),
            ),
          ),
        ],
      ),
    );
  }
}
