import 'package:flutter/material.dart';
import '../coin_referral_manager.dart';
import '../widgets/fz_coin_badge.dart';
import 'zone_feed_screen.dart';       // মূল সোশ্যাল ফিড
import 'premium_hub_screen.dart';     // প্রিমিয়াম হাব (যেখানে সব প্রিমিয়াম ফিচার লক/আনলক হয়)
import 'smart_proximity_radar_screen.dart'; // নিয়ারবাই রাডার
import 'profile_screen.dart';         // ইউজার প্রোফাইল ও ওয়ালেট

class MainAppScreen extends StatefulWidget {
  const MainAppScreen({super.key});

  @override
  State<MainAppScreen> createState() => _MainAppScreenState();
}

class _MainAppScreenState extends State<MainAppScreen> {
  int _currentIndex = 0;

  // অ্যাপের মূল ট্যাবগুলোর তালিকা
  final List<Widget> _screens = [
    const ZoneFeedScreen(),          // ট্যাব ০: হোম ফিড ও পোস্ট
    const SmartProximityRadarScreen(),// ট্যাব ১: নিয়ারবাই রাডার
    const PremiumHubScreen(),        // ট্যাব ২: প্রিমিয়াম ও ইউনিক হাব (কয়েন পারচেজ সহ)
    const ProfileScreen(),           // ট্যাব ৩: ইউজার প্রোফাইল ও কয়েন ব্যালেন্স
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.pink,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Home Feed',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.radar),
            label: 'Radar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star, color: Colors.amber),
            label: 'Premium Hub',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

