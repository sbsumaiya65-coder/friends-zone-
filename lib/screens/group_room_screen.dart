import 'package:flutter/material.dart';
import 'game_zone/games_hub_screen.dart';
import '../coin_referral_manager.dart';

class GroupRoomScreen extends StatefulWidget {
  const GroupRoomScreen({super.key});

  @override
  State<GroupRoomScreen> createState() => _GroupRoomScreenState();
}

class _GroupRoomScreenState extends State<GroupRoomScreen> {
  bool isMuted = false;
  bool isVideoOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Live Voice & Video Room'),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
        actions: [
          // কয়েন ব্যালেন্স দেখার শর্টকাট
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                children: [
                  const Icon(Icons.monetization_on, color: Colors.amber, size: 20),
                  const SizedBox(width: 4),
                  Text(
                    '${CoinReferralManager.userCoins}',
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // রুমের ভিডিও বা স্পিকার গ্রিড এরিয়া
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              color: Colors.black87,
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: List.generate(4, (index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade900,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.pink.shade300, width: 2),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.pink,
                          child: Icon(Icons.person, size: 35, color: Colors.white),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          index == 0 ? 'Biplob (Host)' : 'User Member #$index',
                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.mic, size: 14, color: Colors.green),
                            SizedBox(width: 4),
                            Text('Speaking', style: TextStyle(color: Colors.greenAccent, fontSize: 11)),
                          ],
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
          ),

          // গেম জোন এবং প্রিমিয়াম ফিচার শর্টকাট ব্যানার
          Container(
            padding: const EdgeInsets.all(12),
            color: Colors.pink.shade50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Play Games & Earn Coins!', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.pink)),
                    Text('Unlock VIP avatar & themes with coins.', style: TextStyle(fontSize: 11, color: Colors.grey)),
                  ],
                ),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const GamesHubScreen()),
                    );
                  },
                  icon: const Icon(Icons.games, size: 18),
                  label: const Text('Game Hub'),
                ),
              ],
            ),
          ),

          // কল কন্ট্রোল বাটনগুলো (মিউট, ভিডিও, লিভ)
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            color: Colors.black,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      isMuted = !isMuted;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(isMuted ? 'Mic Muted' : 'Mic Unmuted')),
                    );
                  },
                  icon: Icon(isMuted ? Icons.mic_off : Icons.mic, color: Colors.white),
                  style: IconButton.styleFrom(backgroundColor: isMuted ? Colors.red : Colors.grey.shade800),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      isVideoOn = !isVideoOn;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(isVideoOn ? 'Video Turned On' : 'Video Turned Off')),
                    );
                  },
                  icon: Icon(isVideoOn ? Icons.videocam : Icons.videocam_off, color: Colors.white),
                  style: IconButton.styleFrom(backgroundColor: isVideoOn ? Colors.pink : Colors.grey.shade800),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.call_end, color: Colors.white),
                  style: IconButton.styleFrom(backgroundColor: Colors.red),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
