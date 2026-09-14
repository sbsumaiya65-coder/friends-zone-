import 'package:flutter/material.dart';

class FZPremiumScreen extends StatelessWidget {
  const FZPremiumScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Text('FZ Premium & Unique Modules', style: TextStyle(color: Colors.white, fontSize: 18)),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [Colors.pink, Colors.purple]),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text(
              'Unlock Ultimate Features with FZ Coins 👑\nSpend your earned FZ coins to permanently unlock pro tools!',
              style: TextStyle(color: Colors.white, fontSize: 14, height: 1.4),
            ),
          ),
          const SizedBox(height: 20),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            children: [
              _buildModuleCard('AI Social Twin', '1000 FZ', Icons.smart_toy),
              _buildModuleCard('Mesh Bluetooth', '750 FZ', Icons.bluetooth),
              _buildModuleCard('Time Capsules', '600 FZ', Icons.location_on),
              _buildModuleCard('PK Battle Arena', '400 FZ', Icons.local_fire_department),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildModuleCard(String title, String price, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.pink, size: 30),
          const SizedBox(height: 10),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          const SizedBox(height: 5),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(color: Colors.amber[700], borderRadius: BorderRadius.circular(6)),
            child: Text(price, style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
