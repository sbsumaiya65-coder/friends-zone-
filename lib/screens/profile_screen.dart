import 'package:flutter/material.dart';
import '../coin_referral_manager.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // প্রিমিয়াম শপ আইটেম লিস্ট
  final List<Map<String, dynamic>> premiumItems = [
    {'name': 'Entry Animation FX', 'cost': 50, 'icon': Icons.flash_on, 'type': 'animation'},
    {'name': 'VIP Glowing Avatar', 'cost': 100, 'icon': Icons.verified, 'type': 'avatar'},
    {'name': 'Chamet Style Stickers', 'cost': 30, 'icon': Icons.sticky_note_2, 'type': 'sticker'},
    {'name': 'Dark Premium Theme', 'cost': 80, 'icon': Icons.palette, 'type': 'theme'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile & Premium Store'),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // প্রফাইল হেডার সেকশন
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.pink.shade700, Colors.pink.shade300],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 45,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, size: 50, color: Colors.pink),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Biplob Hossain Billal',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  const Text(
                    'Ishwardi, Pabna (Proximity Active)',
                    style: TextStyle(color: Colors.white70, fontSize: 13),
                  ),
                  const SizedBox(height: 15),
                  // কয়েন ব্যালেন্স কার্ড
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.monetization_on, color: Colors.amber),
                        const SizedBox(width: 8),
                        Text(
                          'Balance: ${CoinReferralManager.userCoins} Coins',
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black87),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Unlock Premium Features with Coins:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            // প্রিমিয়াম শপ লিস্ট
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: premiumItems.length,
              itemBuilder: (context, index) {
                final item = premiumItems[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  elevation: 2,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.pink.shade50,
                      child: Icon(item['icon'], color: Colors.pink),
                    ),
                    title: Text(item['name'], style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text('Cost: ${item['cost']} Coins'),
                    trailing: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        bool success = CoinReferralManager.spendCoins(item['cost'], context);
                        if (success) {
                          setState(() {}); // কয়েন আপডেট রিফ্রেশ করার জন্য
                        }
                      },
                      child: const Text('Unlock'),
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 20),
            // রেফার অ্যান্ড আর্ন অপশন
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber.shade700,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 45),
                ),
                onPressed: () {
                  CoinReferralManager.earnCoins('refer', context);
                  setState(() {});
                },
                icon: const Icon(Icons.card_giftcard),
                label: const Text('Invite Friends & Earn +50 Coins'),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
