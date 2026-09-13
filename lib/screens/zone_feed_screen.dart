import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import '../coin_referral_manager.dart';

// --- সাউন্ড হেল্পার ক্লাস (অটো সাউন্ড বাজানোর জন্য) ---
class SoundHelper {
  static final AudioPlayer _audioPlayer = AudioPlayer();

  static Future<void> playActionSound() async {
    try {
      // লোকাল অ্যাসেট বা সিস্টেম সাউন্ড প্লে করার চেষ্টা করবে
      await _audioPlayer.play(AssetSource('sounds/click.mp3'));
    } catch (e) {
      debugPrint('Sound play note: File not found or running in web/emulator without asset. ($e)');
    }
  }
}

// --- সোশ্যাল জোন ফিড স্ক্রিন ---
class ZoneFeedScreen extends StatefulWidget {
  const ZoneFeedScreen({super.key});

  @override
  State<ZoneFeedScreen> createState() => _ZoneFeedScreenState();
}

class _ZoneFeedScreenState extends State<ZoneFeedScreen> {
  // ডেমো পোস্ট ডাটা তালিকা
  final List<Map<String, dynamic>> posts = [
    {
      'name': 'Biplob Ahmed',
      'time': '2 mins ago',
      'content': 'Enjoying the new proximity social features and live gaming zone! 🚀',
      'likes': 12,
      'comments': 5,
      'shares': 2,
    },
    {
      'name': 'Sarah Khan',
      'time': '15 mins ago',
      'content': 'Playing Ludo and Tic Tac Toe inside voice rooms is super fun! 🎲✨',
      'likes': 28,
      'comments': 10,
      'shares': 4,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zone Feed & Posts'),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
        actions: [
          // লাইভ কয়েন কাউন্টার টপবারে দেখার জন্য
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                children: [
                  const Icon(Icons.monetization_on, color: Colors.amber, size: 20),
                  const SizedBox(width: 4),
                  Text(
                    '${CoinReferralManager.userCoins}',
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            elevation: 3,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ইউজারের প্রোফাইল হেডার
                ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: Colors.pink,
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                  title: Text(post['name'], style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text(post['time'], style: const TextStyle(fontSize: 12)),
                  trailing: const Icon(Icons.more_vert),
                ),
                
                // পোস্টের টেক্সট বা কনটেন্ট
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Text(
                    post['content'],
                    style: const TextStyle(fontSize: 15),
                  ),
                ),

                // পোস্টের মিডিয়া প্রিভিউ বক্স
                Container(
                  height: 180,
                  width: double.infinity,
                  color: Colors.pink.shade50,
                  child: Center(
                    child: Icon(Icons.image, size: 60, color: Colors.pink.shade200),
                  ),
                ),
                const Divider(height: 1),

                // --- লাইক, কমেন্ট ও শেয়ার বাটন সেকশন (সাউন্ড ইফেক্ট সহ) ---
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // ১. লাইক বাটন (+1 Coin)
                      TextButton.icon(
                        onPressed: () {
                          // সাউন্ড বাজবে
                          SoundHelper.playActionSound();
                          // কয়েন যোগ হবে
                          setState(() {
                            post['likes']++;
                            CoinReferralManager.userCoins += 1;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('❤️ Liked! +1 Coin earned'), duration: Duration(milliseconds: 800)),
                          );
                        },
                        icon: const Icon(Icons.favorite, color: Colors.pink),
                        label: Text('Like (${post['likes']})'),
                      ),

                      // ২. কমেন্ট বাটন (+2 Coins)
                      TextButton.icon(
                        onPressed: () {
                          // সাউন্ড বাজবে
                          SoundHelper.playActionSound();
                          // কয়েন যোগ হবে
                          setState(() {
                            post['comments']++;
                            CoinReferralManager.userCoins += 2;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('💬 Commented! +2 Coins earned'), duration: Duration(milliseconds: 800)),
                          );
                        },
                        icon: const Icon(Icons.comment, color: Colors.blue),
                        label: Text('Comment (${post['comments']})'),
                      ),

                      // ৩. শেয়ার বাটন (+5 Coins)
                      TextButton.icon(
                        onPressed: () {
                          // সাউন্ড বাজবে
                          SoundHelper.playActionSound();
                          // কয়েন যোগ হবে
                          setState(() {
                            post['shares']++;
                            CoinReferralManager.userCoins += 5;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('↗️ Shared! +5 Coins earned'), duration: Duration(milliseconds: 800)),
                          );
                        },
                        icon: const Icon(Icons.share, color: Colors.green),
                        label: Text('Share (${post['shares']})'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
