import 'package:flutter/material.dart';
import 'zone_feed_screen.dart'; // জোন ফিড দেখার জন্য
import 'chat_screen.dart';      // ফ্রিতে চ্যাট করার জন্য

class NearbyRadarScreen extends StatefulWidget {
  const NearbyRadarScreen({super.key});

  @override
  State<NearbyRadarScreen> createState() => _NearbyRadarScreenState();
}

class _NearbyRadarScreenState extends State<NearbyRadarScreen> with SingleTickerProviderStateMixin {
  bool isScanning = true;

  // রাডারে পাওয়া কাছাকাছি ইউজারদের ডেমো লিস্ট
  final List<Map<String, dynamic>> nearbyUsers = [
    {'name': 'Rahim Ahmed', 'distance': '120 meters away', 'status': 'Online • Looking to chat'},
    {'name': 'Nusrat Jahan', 'distance': '450 meters away', 'status': 'Online • Playing Games'},
    {'name': 'Tanvir Hossain', 'distance': '850 meters away', 'status': 'Online • Sharing Files'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('📡 Nearby Radar (Free Proximity Zone)'),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
        actions: [
          // কাছাকাছি ইউজারদের ফ্রি জোন ফিড দেখার বাটন
          IconButton(
            icon: const Icon(Icons.dynamic_feed),
            tooltip: 'View Nearby Posts',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ZoneFeedScreen()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // রাডার অ্যানিমেশন ও হেডার ব্যানার
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.pink.shade50,
            child: Column(
              children: [
                const Text(
                  'Scanning users within 2km radius via GPS & Wi-Fi',
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.pink),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                const Icon(Icons.radar, size: 60, color: Colors.pink),
                const SizedBox(height: 10),
                ElevatedButton.styleFrom(backgroundColor: Colors.pink).noDefaultStyle == null ? 
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.pink, foregroundColor: Colors.white),
                    onPressed: () {
                      setState(() {
                        isScanning = !isScanning;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(isScanning ? 'Radar scanning restarted...' : 'Radar paused.')),
                      );
                    },
                    child: Text(isScanning ? 'Pause Radar Scan' : 'Resume Radar Scan'),
                  ) : Container(),
              ],
            ),
          ),
          
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'People Nearby (Free Chat & Socialize):',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),

          // রাডারে পাওয়া ইউজারদের তালিকা
          Expanded(
            child: ListView.builder(
              itemCount: nearbyUsers.length,
              itemBuilder: (context, index) {
                final user = nearbyUsers[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  elevation: 2,
                  child: ListTile(
                    leading: const CircleAvatar(
                      backgroundColor: Colors.pink,
                      child: Icon(Icons.person, color: Colors.white),
                    ),
                    title: Text(user['name'], style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(user['distance'], style: const TextStyle(color: Colors.grey, fontSize: 12)),
                        Text(user['status'], style: const TextStyle(color: Colors.green, fontSize: 11)),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // ফ্রি চ্যাট করার বাটন
                        IconButton(
                          icon: const Icon(Icons.chat_bubble, color: Colors.pink),
                          tooltip: 'Free Chat',
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Opening free chat with ${user['name']}...')),
                            );
                            // চাইলে এখানে সরাসরি চ্যাট স্ক্রিনে নিয়ে যেতে পারেন
                          },
                        ),
                        // পোস্ট দেখার বা লাইক/কমেন্ট করার শর্টকাট
                        IconButton(
                          icon: const Icon(Icons.favorite_border, color: Colors.red),
                          tooltip: 'View Posts',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const ZoneFeedScreen()),
                            );
                          },
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
