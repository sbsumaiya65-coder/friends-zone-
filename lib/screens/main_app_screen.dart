import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'reels_screen.dart';
import 'chats_screen.dart';
import 'premium_hub_screen.dart';
import 'profile_screen.dart';

class MainAppScreen extends StatefulWidget {
  const MainAppScreen({Key? key}) : super(key: key);

  @override
  State<MainAppScreen> createState() => _MainAppScreenState();
}

class _MainAppScreenState extends State<MainAppScreen> {
  int _currentIndex = 0;

  // স্ক্রিন লিস্ট (0: Home, 1: Reels, 2: Chats, 3: FZ Pro, 4: Profile)
  final List<Widget> _screens = [
    const HomeScreen(),       // Index 0
    const ReelsScreen(),      // Index 1
    const ChatsScreen(),      // Index 2 (Chats)
    const PremiumHubScreen(), // Index 3 (FZ Pro)
    const ProfileScreen(),    // Index 4 (Profile if needed)
  ];

  void _showAddOptionsModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF1E1629),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[600],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Create & Share',
                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),
              ListTile(
                leading: const Icon(Icons.post_add, color: Colors.pink, size: 28),
                title: const Text('Create Post', style: TextStyle(color: Colors.white)),
                onTap: () => Navigator.pop(context),
              ),
              ListTile(
                leading: const Icon(Icons.video_collection, color: Colors.purple, size: 28),
                title: const Text('Upload Reel / Feel', style: TextStyle(color: Colors.white)),
                onTap: () => Navigator.pop(context),
              ),
              ListTile(
                leading: const Icon(Icons.live_tv, color: Colors.red, size: 28),
                title: const Text('Go Live', style: TextStyle(color: Colors.white)),
                onTap: () => Navigator.pop(context),
              ),
            ],
          ),
        );
      },
    );
  }

  // বটম বারের আইটেম ইনডেক্স সঠিক করার লজিক
  int _getBottomNavIndex() {
    if (_currentIndex == 2) return 3; // Chats
    if (_currentIndex == 3) return 4; // FZ Pro
    return _currentIndex;            // Home & Reels
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _getBottomNavIndex(),
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF0F0B15),
        selectedItemColor: Colors.pinkAccent,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          if (index == 2) {
            // প্লাস (+) বাটন ক্লিক করলে মডাল আসবে
            _showAddOptionsModal(context);
          } else if (index == 3) {
            // Chats ট্যাব (Screen Index 2)
            setState(() {
              _currentIndex = 2;
            });
          } else if (index == 4) {
            // FZ Pro ট্যাব (Screen Index 3)
            setState(() {
              _currentIndex = 3;
            });
          } else {
            // Home (0) অথবা Reels (1)
            setState(() {
              _currentIndex = index;
            });
          }
        },
        items: [
          const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          const BottomNavigationBarItem(icon: Icon(Icons.video_library), label: 'Reels'),
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: Colors.pink,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.add, color: Colors.white, size: 22),
            ),
            label: '',
          ),
          const BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline), label: 'Chats'),
          const BottomNavigationBarItem(icon: Text('FZ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)), label: 'FZ Pro'),
        ],
      ),
    );
  }
}
