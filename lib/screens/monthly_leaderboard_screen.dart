import 'package:flutter/material.dart';
import '../managers/creator_leaderboard_manager.dart';

class MonthlyLeaderboardScreen extends StatelessWidget {
  const MonthlyLeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final leaderboard = CreatorLeaderboardManager.getMonthlyLeaderboardData();

    return Scaffold(
      appBar: AppBar(
        title: const Text('🏆 Monthly Creator Top 10 & Rewards'),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // ব্যানার
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Colors.amber.shade700, Colors.pink.shade600]),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Friends Zone Monthly Rewards 🌟',
                  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 6),
                Text(
                  'Top 10 creators get massive FZ coins! The Top 3 winners receive exclusive VIP animations, special physical/digital gifts, and ultimate features.',
                  style: TextStyle(color: Colors.white70, fontSize: 13),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'This Month Leaderboard Ranking:',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),

          // লিস্ট ভিউ
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: leaderboard.length,
            itemBuilder: (context, index) {
              var item = leaderboard[index];
              int rank = item['rank'];

              // টপ ৩ জনের জন্য বিশেষ রঙ
              Color rankColor = rank == 1 ? Colors.amber : (rank == 2 ? Colors.grey.shade400 : (rank == 3 ? Colors.brown.shade300 : Colors.pink.shade100));

              return Card(
                elevation: rank <= 3 ? 4 : 1,
                margin: const EdgeInsets.symmetric(vertical: 6),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: rankColor,
                    child: Text(
                      '$rank',
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  title: Text(item['name'], style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text('Views: ${item['views']} • ${item['prize']}'),
                  trailing: rank <= 3
                      ? const Icon(Icons.workspace_premium, color: Colors.amber, size: 28)
                      : const Icon(Icons.star_border, color: Colors.pink),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
