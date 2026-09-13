import 'package:flutter/material.dart';

class PkBattleScreen extends StatefulWidget {
  const PkBattleScreen({super.key});

  @override
  State<PkBattleScreen> createState() => _PkBattleScreenState();
}

class _PkBattleScreenState extends State<PkBattleScreen> {
  int teamAScore = 120;
  int teamBScore = 95;

  void _supportTeam(String team) {
    setState(() {
      if (team == 'A') {
        teamAScore += 10;
      } else {
        teamBScore += 10;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🔥 Live PK Battle Arena'),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // প্রোগ্রেস বার বা স্কোর কম্পেয়ারিশন
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.pink.shade50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Team A: $teamAScore', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.pink)),
                const Text('VS', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey)),
                Text('Team B: $teamBScore', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.purple)),
              ],
            ),
          ),
          const SizedBox(height: 20),
          // দুই পক্ষের লাইভ ভিডিও/অডিও স্লট
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.pink.shade100,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Center(
                      child: Text('Team A Host', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.pink)),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.purple.shade100,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Center(
                      child: Text('Team B Host', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.purple)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // সাপোর্ট বাটন
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.pink, foregroundColor: Colors.white),
                  onPressed: () => _supportTeam('A'),
                  child: const Text('Support Team A ❤️'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.purple, foregroundColor: Colors.white),
                  onPressed: () => _supportTeam('B'),
                  child: const Text('Support Team B 💖'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
