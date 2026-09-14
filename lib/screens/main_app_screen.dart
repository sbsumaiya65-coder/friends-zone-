import 'package:flutter/material.dart';
import '../coin_referral_manager.dart';
import '../widgets/fz_coin_badge.dart';
import 'zone_feed_screen.dart';       // মূল সোশ্যাল ফিড
import 'smart_proximity_radar_screen.dart'; // নিয়ারবাই রাডার
import 'premium_hub_screen.dart';     // প্রিমিয়াম হাব
import 'profile_screen.dart';         // ইউজার প্রোফাইল ও ওয়ালেট
import 'monthly_leaderboard_screen.dart'; // মাসিক ক্রিয়েটর লিডারবোর্ড ও গিফট স্ক্রিন

class MainAppScreen extends StatefulWidget {
  const MainAppScreen({super.key});

  @override
  State<MainAppScreen> createState() => _MainAppScreenState();
}

class _MainAppScreenState extends State<MainAppScreen> {
  int _currentIndex = 0;

  // অ্যাপের মূল ট্যাবগুলোর তালিকা (লিডারবোর্ড সহ)
  final List<Widget> _screens = [
    const ZoneFeedScreen(),             // ট্যাব ০: হোম ফিড
    const SmartProximityRadarScreen(),   // ট্যাব ১: নিয়ারবাই রাডার
    const PremiumHubScreen(),           // ট্যাব ২: প্রিমিয়াম হাব
    const MonthlyLeaderboardScreen(),   // ট্যাব ৩: মাসিক টপ ১০ লিডারবোর্ড ও রিওয়ার্ড
    const ProfileScreen(),              // ট্যাব ৪: প্রোফাইল ও ওয়ালেট
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
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.radar),
            label: 'Radar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star, color: Colors.amber),
            label: 'Premium',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_events, color: Colors.deepOrange),
            label: 'Leaderboard',
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
