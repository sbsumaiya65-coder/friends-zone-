import 'package:flutter/material.dart';
import 'zone_feed_screen.dart';       // হোম ফিড
import 'premium_hub_screen.dart';     // FZ প্রিমিয়াম ও শপ হাব
import 'profile_screen.dart';         // প্রোফাইল স্ক্রিন
import 'media_editor_post_screen.dart'; // পোস্ট ক্রিয়েট স্ক্রিন

class MainAppScreen extends StatefulWidget {
  const MainAppScreen({super.key});

  @override
  State<MainAppScreen> createState() => _MainAppScreenState();
}

class _MainAppScreenState extends State<MainAppScreen> {
  int _currentIndex = 0;

  // স্ক্রিনগুলোর তালিকা
  final List<Widget> _screens = [
    const ZoneFeedScreen(),         // ট্যাব ০: হোম
    const Center(child: Text('FZ Feels & Reels Feed', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))), // ট্যাব ১: Feels
    const SizedBox.shrink(),        // ট্যাব ২: মাঝের প্লাস বাটন
    // চ্যাট স্ক্রিন (ট্যাব ৩)
    Scaffold(
      appBar: AppBar(
        title: const Text('💬 FZ Chats & Messages'),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.pink.shade100,
              child: const Icon(Icons.person, color: Colors.pink),
            ),
            title: Text('Friend ${index + 1}'),
            subtitle: const Text('Hey! Check out my new post...'),
            trailing: const Text('10:45 AM', style: TextStyle(fontSize: 12, color: Colors.grey)),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Opening chat conversation...')),
              );
            },
          );
        },
      ),
    ),
    const PremiumHubScreen(),       // ট্যাব ৪: 'FZ' শপ বা প্রিমিয়াম হাব
    const ProfileScreen(),          // ট্যাব ৫: প্রোফাইল
  ];

  // মাঝের প্লাস বাটনে ক্লিক করলে ক্রিয়েট বটম শিট ওপেন হবে
  void _showCreateBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Create in Friends Zone',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black87),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildCreateOption(context, Icons.grid_view, 'Post', Colors.pink, const MediaEditorPostScreen()),
                  _buildCreateOption(context, Icons.add_circle, 'Story', Colors.pinkAccent, null),
                  _buildCreateOption(context, Icons.video_collection, 'Feels', Colors.purple, null),
                  _buildCreateOption(context, Icons.touch_app, 'Flick', Colors.deepOrange, null),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildCreateOption(context, Icons.live_tv, 'Live', Colors.red, null),
                  _buildCreateOption(context, Icons.mic, 'Audio Soon', Colors.amber.shade800, null),
                  const SizedBox(width: 70), 
                  const SizedBox(width: 70),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCreateOption(BuildContext context, IconData icon, String label, Color color, Widget? targetScreen) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context); 
        if (targetScreen != null) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => targetScreen));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('$label feature coming soon to Friends Zone!'), backgroundColor: color),
          );
        }
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 28),
          ),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.black87)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    int navIndex = _currentIndex > 2 ? _currentIndex - 1 : _currentIndex;

    return Scaffold(
      body: _screens[_currentIndex == 2 ? 0 : _currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navIndex,
        selectedItemColor: Colors.pink,
        unselectedItemColor: Colors.grey.shade600,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        onTap: (index) {
          int actualIndex = index >= 2 ? index + 1 : index;
          if (actualIndex == 2) {
            _showCreateBottomSheet(context);
          } else {
            setState(() {
              _currentIndex = actualIndex;
            });
          }
        },
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.video_library_outlined),
            label: '',
          ),
          // মাঝের প্লাস বাটন (কনস্ট্যান্ট ত্রুটি দূর করা হয়েছে)
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: Color(0xFF1E1B4B),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.add, color: Colors.white, size: 24),
            ),
            label: '',
          ),
          // চ্যাট আইকন ট্যাব
          const BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: Text('FZ', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18, color: Colors.pink)),
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: '',
          ),
        ],
      ),
    );
  }
}
