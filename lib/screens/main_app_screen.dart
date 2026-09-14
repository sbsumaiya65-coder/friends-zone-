import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'reels_screen.dart';
import 'chat_list_screen.dart';
import 'fz_premium_screen.dart';
import 'profile_screen.dart';

class MainAppScreen extends StatefulWidget {
  const MainAppScreen({Key? key}) : super(key: key);

  @override
  State<MainAppScreen> createState() => _MainAppScreenState();
}

class _MainAppScreenState extends State<MainAppScreen> {
  int _currentIndex = 0;

  // সব মূল স্ক্রিনগুলোর সঠিক লিস্ট (এখানে FZPremiumScreen ব্যবহার করা হয়েছে)
  final List<Widget> _screens = [
    const HomeScreen(),       // Index 0: Home / Feed
    const ReelsScreen(),      // Index 1: Reels / Feels
    const ChatListScreen(),   // Index 2: Chat & Messages
    const FZPremiumScreen(),  // Index 3: FZ Unique Features
    const ProfileScreen(),    // Index 4: User Profile
  ];

  // প্লাস (+) বাটনে ক্লিক করলে যে পপআপ বা বটম শিট আসবে
  void _showAddOptionsModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
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
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Create & Share',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              ListTile(
                leading: const Icon(Icons.post_add, color: Colors.pink, size: 28),
                title: const Text('Create Post'),
                subtitle: const Text('Share photos, thoughts and updates'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.video_collection, color: Colors.purple, size: 28),
                title: const Text('Upload Reel / Feel'),
                subtitle: const Text('Share short videos with friends'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.live_tv, color: Colors.red, size: 28),
                title: const Text('Go Live'),
                subtitle: const Text('Start a live stream or voice room'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex > 2 ? _currentIndex - 1 : _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.pink,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          // লজিক: মাঝখানের প্লাস আইকনে ক্লিক করলে পপআপ আসবে
          if (index == 2) {
            _showAddOptionsModal(context);
          } else if (index > 2) {
            setState(() {
              _currentIndex = index + 1;
            });
          } else {
            setState(() {
              _currentIndex = index;
            });
          }
        },
        items: [
          const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          const BottomNavigationBarItem(icon: Icon(Icons.video_library), label: 'Reels'),
          // মাঝখানের কাস্টম প্লাস বাটন
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: Color(0xFF1E1E30),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.add, color: Colors.white, size: 24),
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
