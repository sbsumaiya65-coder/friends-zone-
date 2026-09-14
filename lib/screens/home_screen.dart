import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Friends Zone',
          style: TextStyle(color: Colors.pink, fontWeight: FontWeight.bold, fontSize: 22),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.amber[100],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: const [
                Icon(Icons.monetization_on, color: Colors.amber, size: 18),
                SizedBox(width: 4),
                Text('150', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87)),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.black87),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: [
          // ফেসবুকের মতো ওপরের স্টোরি ও ইউজার হাইলাইট সেকশন
          Container(
            height: 100,
            color: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.pink[200],
                        child: const Icon(Icons.person, color: Colors.white, size: 30),
                      ),
                      const SizedBox(height: 4),
                      Text(index == 0 ? 'Your Story' : 'Friend $index', style: const TextStyle(fontSize: 12)),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          // পোস্ট কার্ড ১
          _buildPostCard('Biplob Ahmed', '2 mins ago', 'Enjoying the new proximity social features and live gaming zone with FZ Coins! 🚀'),
          // পোস্ট কার্ড ২
          _buildPostCard('Sarah Khan', '15 mins ago', 'Playing Ludo and Tic Tac Toe inside voice rooms is super fun! 🎲✨'),
        ],
      ),
    );
  }

  Widget _buildPostCard(String name, String time, String content) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      color: Colors.white,
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(radius: 20, backgroundColor: Colors.pink, child: Icon(Icons.person, color: Colors.white)),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  Text(time, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                ],
              ),
              const Spacer(),
              const Icon(Icons.more_vert, color: Colors.grey),
            ],
          ),
          const SizedBox(height: 10),
          Text(content, style: const TextStyle(fontSize: 14)),
          const SizedBox(height: 10),
          Container(
            height: 180,
            decoration: BoxDecoration(
              color: Colors.pink[50],
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Center(child: Icon(Icons.image, size: 50, color: Colors.pink300)),
          ),
        ],
      ),
    );
  }
}
