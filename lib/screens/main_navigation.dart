import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'reels_screen.dart';
import 'chats_screen.dart'; // আপনার প্রজেক্টের আসল চ্যাট ফাইলের নাম অনুযায়ী (chats_screen.dart)
import 'premium_hub_screen.dart'; // আপনার প্রজেক্টের প্রিমিয়াম স্ক্রিনের নাম অনুযায়ী
import 'profile_screen.dart';

class MainAppScreen extends StatefulWidget {
  const MainAppScreen({Key? key}) : super(key: key);

  @override
  State<MainAppScreen> createState() => _MainAppScreenState();
}

class _MainAppScreenState extends State<MainAppScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),       
    const ReelsScreen(),      
    const ChatListScreen(),   
    const PremiumHubScreen(),  
    const ProfileScreen(),    
  ];

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
                onTap: () => Navigator.pop(context),
              ),
              ListTile(
                leading: const Icon(Icons.video_collection, color: Colors.purple, size: 28),
                title: const Text('Upload Reel / Feel'),
                onTap: () => Navigator.pop(context),
              ),
              ListTile(
                leading: const Icon(Icons.live_tv, color: Colors.red, size: 28),
                title: const Text('Go Live'),
                onTap: () => Navigator.pop(context),
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
