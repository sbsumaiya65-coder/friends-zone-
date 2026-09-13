import 'package:flutter/material.dart';
import 'dart:math' as math;

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> with SingleTickerProviderStateMixin {
  late AnimationController _radarController;
  bool isSearching = true;

  // ডেমো নিয়ারবাই ইউজার ডেটা (জি পি এস ও প্রক্সিমিটি বেসড)
  final List<Map<String, dynamic>> nearbyUsers = [
    {'name': 'Tanvir Ahmed', 'distance': '0.5 km', 'online': true, 'isFollowing': false, 'isFriend': false},
    {'name': 'Nusrat Jahan', 'distance': '1.2 km', 'online': true, 'isFollowing': true, 'isFriend': true},
    {'name': 'Rahim Chowdhury', 'distance': '1.8 km', 'online': false, 'isFollowing': false, 'isFriend': false},
    {'name': 'Sadia Afrin', 'distance': '2.0 km', 'online': true, 'isFollowing': false, 'isFriend': false},
  ];

  @override
  void initState() {
    super.initState();
    _radarController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();
  }

  @override
  void dispose() {
    _radarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nearby Radar & Discover'),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.gps_fixed),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('GPS Enabled: Scanning 2km radius...')),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // রাডার স্ক্যানিং অ্যানিমেশন উইজেট
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.pink.shade700, Colors.pink.shade300],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                RotationTransition(
                  turns: _radarController,
                  child: Container(
                    width: 180,
                    height: 180,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white.withOpacity(0.6), width: 2),
                      gradient: SweepGradient(
                        colors: [
                          Colors.white.withOpacity(0.0),
                          Colors.white.withOpacity(0.4),
                        ],
                      ),
                    ),
                  ),
                ),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.radar, size: 50, color: Colors.white),
                    SizedBox(height: 8),
                    Text(
                      'Scanning Nearby Users (Within 2 KM)...',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
          
          // নিয়ারবাই ইউজার লিস্ট
          Expanded(
            child: ListView.builder(
              itemCount: nearbyUsers.length,
              padding: const EdgeInsets.all(10),
              itemBuilder: (context, index) {
                final user = nearbyUsers[index];
                return Card(
                  elevation: 3,
                  margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 5),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: ListTile(
                    leading: Stack(
                      children: [
                        const CircleAvatar(
                          backgroundColor: Colors.pinkAccent,
                          child: Icon(Icons.person, color: Colors.white),
                        ),
                        if (user['online'])
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: Container(
                              width: 12,
                              height: 12,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.white, width: 2),
                              ),
                            ),
                          ),
                      ],
                    ),
                    title: Text(
                      user['name'],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('Distance: ${user['distance']} • ${user['online'] ? "Online" : "Offline"}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Add Friend Button
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: user['isFriend'] ? Colors.grey : Colors.pink,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                          ),
                          onPressed: () {
                            setState(() {
                              user['isFriend'] = !user['isFriend'];
                            });
                          },
                          child: Text(user['isFriend'] ? 'Friends' : 'Add Friend'),
                        ),
                        const SizedBox(width: 6),
                        // Follow Button
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.pink,
                            side: const BorderSide(color: Colors.pink),
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                          ),
                          onPressed: () {
                            setState(() {
                              user['isFollowing'] = !user['isFollowing'];
                            });
                          },
                          child: Text(user['isFollowing'] ? 'Following' : 'Follow'),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
