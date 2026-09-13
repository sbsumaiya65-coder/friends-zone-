import 'package:flutter/material.dart';
import '../coin_referral_manager.dart';
import '../widgets/fz_coin_badge.dart';

class UniqueFeaturesStoreScreen extends StatefulWidget {
  const UniqueFeaturesStoreScreen({super.key});

  @override
  State<UniqueFeaturesStoreScreen> createState() => _UniqueFeaturesStoreScreenState();
}

class _UniqueFeaturesStoreScreenState extends State<UniqueFeaturesStoreScreen> {
  // ইউনিক প্রিমিয়াম ফিচারসমূহের তালিকা
  final List<Map<String, dynamic>> uniqueFeatures = [
    {
      'id': 'time_capsule',
      'title': '📍 Proximity Time Capsule',
      'desc': 'Leave secret photos or voice notes locked at real GPS coordinates for others to discover.',
      'cost': 250,
      'isUnlocked': false,
    },
    {
      'id': 'mesh_chat',
      'title': '📶 Offline Mesh Bluetooth Chat',
      'desc': 'Chat and share files with nearby users without internet using Bluetooth & Wi-Fi Direct chains.',
      'cost': 400,
      'isUnlocked': false,
    },
    {
      'id': 'ai_twin',
      'title': '🤖 AI Social Twin Clone',
      'desc': 'Let your intelligent AI clone chat and reply to messages when you are offline.',
      'cost': 600,
      'isUnlocked': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🌟 Unique & Proximity Store'),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: FZCoinBadge(coinAmount: CoinReferralManager.userCoins),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: uniqueFeatures.length,
        itemBuilder: (context, index) {
          final feature = uniqueFeatures[index];
          bool unlocked = feature['isUnlocked'];

          return Card(
            elevation: 4,
            margin: const EdgeInsets.only(bottom: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.between,
                    children: [
                      Text(
                        feature['title'],
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.pink),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: unlocked ? Colors.green.shade100 : Colors.amber.shade100,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          unlocked ? 'UNLOCKED' : '${feature['cost']} 𝗙𝗭',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: unlocked ? Colors.green.shade800 : Colors.amber.shade900,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    feature['desc'],
                    style: const TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.styleFrom(
                      backgroundColor: unlocked ? Colors.grey.shade300 : Colors.pink,
                      foregroundColor: unlocked ? Colors.black87 : Colors.white,
                    ).noDefaultStyle == null ? ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: unlocked ? Colors.grey.shade300 : Colors.pink,
                        foregroundColor: unlocked ? Colors.black87 : Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      onPressed: () {
                        if (unlocked) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Launching ${feature['title']}...')),
                          );
                        } else {
                          // কয়েন কাটানোর লজিক চেক করা
                          bool success = CoinReferralManager.spendCoins(feature['cost'], context);
                          if (success) {
                            setState(() {
                              feature['isUnlocked'] = true;
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('🎉 Successfully unlocked ${feature['title']}!'),
                                backgroundColor: Colors.green,
                              ),
                            );
                          }
                        }
                      },
                      child: Text(unlocked ? 'Open Feature 🚀' : 'Unlock with FZ Coins 👑'),
                    ) : Container(),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
