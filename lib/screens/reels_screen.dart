import 'package:flutter/material.dart';

class ReelsScreen extends StatelessWidget {
  const ReelsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0B15),
      body: Stack(
        children: [
          // Reel Video Background Placeholder
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.purple.shade900, Colors.pink.shade900, Colors.black],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: const Center(
              child: Icon(Icons.play_circle_outline, size: 80, color: Colors.white38),
            ),
          ),
          
          // Top Bar Title
          Positioned(
            top: 45,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Reels / Feels',
                  style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Icon(Icons.camera_alt_outlined, color: Colors.white, size: 24),
              ],
            ),
          ),

          // Right Side Action Buttons
          Positioned(
            right: 16,
            bottom: 80,
            child: Column(
              children: const [
                CircleAvatar(
                  backgroundColor: Colors.black45,
                  child: Icon(Icons.favorite, color: Colors.pinkAccent),
                ),
                SizedBox(height: 4),
                Text('12.5K', style: TextStyle(color: Colors.white, fontSize: 11)),
                SizedBox(height: 16),
                CircleAvatar(
                  backgroundColor: Colors.black45,
                  child: Icon(Icons.comment, color: Colors.white),
                ),
                SizedBox(height: 4),
                Text('480', style: TextStyle(color: Colors.white, fontSize: 11)),
                SizedBox(height: 16),
                CircleAvatar(
                  backgroundColor: Colors.black45,
                  child: Icon(Icons.share, color: Colors.white),
                ),
              ],
            ),
          ),

          // Bottom Info (User details & caption)
          Positioned(
            bottom: 20,
            left: 16,
            right: 80,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.pink,
                      child: Icon(Icons.person, size: 18, color: Colors.white),
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Biplob Hossain',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  'Enjoying the sunset moments at Ishwardi! ✨ #FriendsZone',
                  style: TextStyle(color: Colors.white70, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
