import 'package:flutter/material.dart';
import '../coin_referral_manager.dart';
import '../widgets/fz_coin_badge.dart';
import 'vip_store_screen.dart';
import 'game_zone/games_hub_screen.dart';
import 'voice_changer_screen.dart';
import 'pk_battle_screen.dart';
import 'time_capsule_screen.dart';
import 'mesh_chat_screen.dart';
import 'ai_twin_screen.dart';

class PremiumHubScreen extends StatelessWidget {
  const PremiumHubScreen({super.key});

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
          // ব্যানার হেডার
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
                  'Unlock Ultimate Features 👑',
                  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 6),
                Text(
                  'Use your FZ Coins to access exclusive pro tools, games, proximity capsules, and AI twins!',
                  style: TextStyle(color: Colors.white70, fontSize: 13),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          const Text(
            'All Premium Modules:',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),
          ),
          const SizedBox(height: 12),

        // ফিচার গ্রিড লিস্ট
          GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics,
            children: [
              _buildFeatureCard(
                context,
                'VIP Store',
                'Frames & Badges',
                Icons.diamond,
                Colors.amber,
                () => Navigator.push(context, MaterialPageRoute(builder: (context) => const VipStoreScreen())),
              ),
              _buildFeatureCard(
                context,
                'Game Zone Hub',
                'Ludo, Tic-Tac-Toe, Spin',
                Icons.games,
                Colors.pink,
                () => Navigator.push(context, MaterialPageRoute(builder: (context) => const GamesHubScreen())),
              ),
              _buildFeatureCard(
                context,
                'PK Battle Arena',
                'Live Group Battles',
                Icons.local_fire_department,
                Colors.deepOrange,
                () => Navigator.push(context, MaterialPageRoute(builder: (context) => const PkBattleScreen())),
              ),
              _buildFeatureCard(
                context,
                'Magic Voice',
                'Robot, Child, Monster',
                Icons.mic,
                Colors.purple,
                () => Navigator.push(context, MaterialPageRoute(builder: (context) => const VoiceChangerScreen())),
              ),
              _buildFeatureCard(
                context,
                'Time Capsules',
                'GPS Secret Memories',
                Icons.pin_drop,
                Colors.green,
                () => Navigator.push(context, MaterialPageRoute(builder: (context) => const TimeCapsuleScreen())),
              ),
              _buildFeatureCard(
                context,
                'Mesh Bluetooth Chat',
                'Zero Internet P2P Chat',
                Icons.bluetooth_connected,
                Colors.blue,
                () => Navigator.push(context, MaterialPageRoute(builder: (context) => const MeshChatScreen())),
              ),
              _buildFeatureCard(
                context,
                'AI Social Twin',
                'Digital Clone Auto-Chat',
                Icons.smart_toy,
                Colors.indigo,
                () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AiTwinScreen())),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureCard(
    BuildContext context,
    String title,
    String subtitle,
    IconData icon,
    Color color,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color.withOpacity(0.08),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color.withOpacity(0.5), width: 1.5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 36, color: color),
            const SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: color),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 2),
            Text(
              subtitle,
              style: const TextStyle(fontSize: 11, color: Colors.grey),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
