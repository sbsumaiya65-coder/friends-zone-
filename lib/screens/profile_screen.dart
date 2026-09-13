import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Center(
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.pink,
                child: Icon(Icons.person, size: 60, color: Colors.white),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Biplob Hossain Billal',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const Text('Ishwardi, Pabna', style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 24),
            ListTile(
              leading: const Icon(Icons.settings, color: Colors.pink),
              title: const Text('Account Settings'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.monetization_on, color: Colors.pink),
              title: const Text('Coins & Referrals'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text('Logout', style: TextStyle(color: Colors.red)),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/auth');
              },
            ),
          ],
        ),
      ),
    );
  }
}
