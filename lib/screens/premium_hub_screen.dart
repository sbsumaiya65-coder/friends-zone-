import 'package:flutter/material.dart';

class PremiumHubScreen extends StatelessWidget {
  const PremiumHubScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0B15),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F0B15),
        elevation: 0,
        title: Row(
          children: const [
            Icon(Icons.star, color: Colors.amber, size: 24),
            SizedBox(width: 8),
            Text('FZ Pro & Hub', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
          ],
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(12),
        children: [
          // Banner Card
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.pink.shade800, Colors.purple.shade900],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(color: Colors.pink.withOpacity(0.3), blurRadius: 10, spreadRadius: 2),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('FZ VIP MEMBERSHIP', style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold, fontSize: 12, letterSpacing: 1.2)),
                SizedBox(height: 8),
                Text('Unlock Unlimited Power & Pro Features', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Text('Get verified badge, radar boost, unlimited messaging and exclusive community themes.', style: TextStyle(color: Colors.white70, fontSize: 12)),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Text('Exclusive Features', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          _buildFeatureTile(Icons.radar, 'Radar Boost', 'Find friends near you instantly with VIP radar range.'),
          _buildFeatureTile(Icons.verified, 'Verified Badge', 'Stand out in the community with a gold/pink verified tick.'),
          _buildFeatureTile(Icons.bolt, 'Unlimited Feels & Chats', 'No limits on messaging, reels uploading, and story highlights.'),
          _buildFeatureTile(Icons.monetization_on, 'FZ Tokens Reward', 'Earn daily bonus tokens and redeem exciting perks.'),
        ],
      ),
    );
  }

  Widget _buildFeatureTile(IconData icon, String title, String subtitle) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1325),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.pink.withOpacity(0.2)),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.pink.withOpacity(0.2),
          child: Icon(icon, color: Colors.pinkAccent),
        ),
        title: Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
        subtitle: Text(subtitle, style: const TextStyle(color: Colors.grey, fontSize: 11)),
      ),
    );
  }
}
