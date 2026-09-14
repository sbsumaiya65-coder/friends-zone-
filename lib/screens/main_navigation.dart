import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'discover_screen.dart';
import 'chats_screen.dart';
import 'monthly_leaderboard_screen.dart'; // মাসিক লিডারবোর্ড স্ক্রিন ইমপোর্ট
import 'profile_screen.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;

  // নেভিগেশন ট্যাবগুলোর তালিকা (লিডারবোর্ড সহ)
  final List<Widget> _screens = [
    const HomeScreen(),
    const DiscoverScreen(),
    const ChatsScreen(),
    const MonthlyLeaderboardScreen(), // নতুন লিডারবোর্ড ট্যাব
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.pink,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed, // ৫টি ট্যাব একসাথে ঠিকভাবে দেখানোর জন্য
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Discover'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chats'),
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_events, color: Colors.deepOrange), 
            label: 'Leaderboard',
          ), // নতুন লিডারবোর্ড আইকন
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
