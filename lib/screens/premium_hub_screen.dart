import 'package:flutter/material.dart';
import '../coin_referral_manager.dart';
import '../widgets/fz_coin_badge.dart';
import '../managers/sound_effect_manager.dart';
import 'vip_store_screen.dart';
import 'game_zone/games_hub_screen.dart';
import 'voice_changer_screen.dart';
import 'pk_battle_screen.dart';
import 'time_capsule_screen.dart';
import 'mesh_chat_screen.dart';
import 'ai_twin_screen.dart';
import 'media_editor_post_screen.dart';

class PremiumHubScreen extends StatefulWidget {
  const PremiumHubScreen({super.key});

  @override
  State<PremiumHubScreen> createState() => _PremiumHubScreenState();
}

class _PremiumHubScreenState extends State<PremiumHubScreen> {
  final Map<String, Map<String, dynamic>> featuresData = {
    'ai_twin': {
      'title': 'AI Social Twin',
      'subtitle': 'Digital Clone Auto-Chat',
      'icon': Icons.smart_toy,
      'color': Colors.teal,
      'cost': 1000,
      'unlocked': false,
      'screen': const AiTwinScreen()
    },
    'mesh_chat': {
      'title': 'Mesh Bluetooth Chat',
      'subtitle': 'Zero Internet P2P Chat',
      'icon': Icons.bluetooth_connected,
      'color': Colors.blue,
      'cost': 750,
      'unlocked': false,
      'screen': const MeshChatScreen()
    },
    'time_capsules': {
      'title': 'Time Capsules',
      'subtitle': 'GPS Secret Memories',
      'icon': Icons.pin_drop,
      'color': Colors.green,
      'cost': 600,
      'unlocked': false,
      'screen': const TimeCapsuleScreen()
    },
    'pk_battle': {
      'title': 'PK Battle Arena',
      'subtitle': 'Live Group Battles',
      'icon': Icons.local_fire_department,
      'color': Colors.deepOrange,
      'cost': 400,
      'unlocked': false,
      'screen': const PkBattleScreen()
    },
    'media_editor': {
      'title': 'Pro Media Editor',
      'subtitle': 'AI Filters & Enhancer',
      'icon': Icons.auto_fix_high,
      'color': Colors.deepPurple,
      'cost': 350,
      'unlocked': false,
      'screen': const MediaEditorPostScreen()
    },
    'vip_store': {
      'title': 'VIP Store',
      'subtitle': 'Frames & Badges',
      'icon': Icons.diamond,
      'color': Colors.amber,
      'cost': 300,
      'unlocked': false,
      'screen': const VipStoreScreen()
    },
    'game_hub': {
      'title': 'Game Zone Hub',
      'subtitle': 'Ludo, Tic-Tac-Toe, Spin',
      'icon': Icons.games,
      'color': Colors.purple,
      'cost': 200,
      'unlocked': false,
      'screen': const GamesHubScreen()
    },
    'voice_changer': {
      'title': 'Magic Voice',
      'subtitle': 'Robot, Child, Monster',
      'icon': Icons.mic,
      'color': Colors.indigo,
      'cost': 150,
      'unlocked': false,
      'screen': const VoiceChangerScreen()
    },
  };

  void _handleFeatureTap(String key, Map<String, dynamic> feature) {
    bool isUnlocked = feature['unlocked'];
    int cost = feature['cost'];
    String title = feature['title'];

    if (isUnlocked) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => feature['screen']));
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            title: Row(
              children: [
                const Icon(Icons.lock, color: Colors.pink),
                const SizedBox(width: 8),
                Text('Unlock $title'),
              ],
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('This is an exclusive premium feature. Spend $cost 𝗙𝗭 Coins to unlock it permanently.'),
                const SizedBox(height: 12),
                Row(
                  children: [
                    const Text('Your Balance: ', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('${CoinReferralManager.userCoins} 𝗙𝗭', style: const TextStyle(color: Colors.pink, fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel', style: TextStyle(color: Colors.grey)),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.pink, foregroundColor: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                  bool success = CoinReferralManager.spendCoins(cost, context);
                  if (success) {
                    SoundEffectManager.playPurchaseSound();
                    setState(() {
                      featuresData[key]!['unlocked'] = true;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('🎉 Successfully unlocked $title with VIP Sound!'),
                        backgroundColor: Colors.green,
                      ),
                    );
                    Navigator.push(context, MaterialPageRoute(builder: (context) => feature['screen']));
                  }
                },
                child: const Text('Unlock Now 👑'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🌟 FZ Premium & Unique Hub'),
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
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.pink.shade400, Colors.purple.shade600],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Unlock Ultimate Features with FZ Coins 👑',
                  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 6),
                Text(
                  'Spend your earned FZ coins to permanently unlock pro tools and secret features!',
                  style: TextStyle(color: Colors.white70, fontSize: 13),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'All Premium & Unique Modules:',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),
          ),
          const SizedBox(height: 12),
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: featuresData.length,
            itemBuilder: (context, index) {
              String key = featuresData.keys.elementAt(index);
              var feature = featuresData[key]!;
              bool isUnlocked = feature['unlocked'];
              Color color = feature['color'];

              return InkWell(
                onTap: () => _handleFeatureTap(key, feature),
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: color.withOpacity(isUnlocked ? 0.15 : 0.08),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: color.withOpacity(isUnlocked ? 1.0 : 0.5),
                      width: isUnlocked ? 2.0 : 1.5,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween, // ঠিক করা হলো
                        children: [
                          Icon(feature['icon'], size: 32, color: color),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: isUnlocked ? Colors.green : Colors.amber.shade800,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              isUnlocked ? 'UNLOCKED' : '${feature['cost']} 𝗙𝗭',
                              style: const TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        feature['title'],
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: color),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        feature['subtitle'],
                        style: const TextStyle(fontSize: 11, color: Colors.grey),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
