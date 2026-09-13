import 'package:flutter/material.dart';
import 'game_zone/spin_wheel_game.dart';
import 'tictactoe_screen.dart';
import 'ludo_game_screen.dart';
import '../coin_referral_manager.dart';

class GroupRoomScreen extends StatefulWidget {
  const GroupRoomScreen({super.key});

  @override
  State<GroupRoomScreen> createState() => _GroupRoomScreenState();
}

class _GroupRoomScreenState extends State<GroupRoomScreen> {
  bool isMuted = false;
  bool isVideoOn = false;

  // গ্রুপ রুমের ভেতরে গেম হাব পপআপ ওপেন করার ফাংশন
  void _openGroupGameHub(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          height: 320,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.between,
                children: [
                  Text(
                    '🎮 Group Game Hub',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.pink),
                  ),
                  Icon(Icons.games, color: Colors.pink),
                ],
              ),
              const SizedBox(height: 12),
              const Text('Select a game to play while chatting:', style: TextStyle(color: Colors.grey, fontSize: 13)),
              const SizedBox(height: 15),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: [
                    _buildGameIcon(context, 'Tic Tac Toe', Icons.grid_3x3, Colors.pink, const TicTacToeScreen()),
                    _buildGameIcon(context, 'Ludo Arena', Icons.casino, Colors.purple, const LudoGameScreen()),
                    _buildGameIcon(context, 'Lucky Spin', Icons.star, Colors.amber, const SpinWheelGameScreen()),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildGameIcon(BuildContext context, String title, IconData icon, Color color, Widget targetScreen) {
    return InkWell(
      onTap: () {
        Navigator.pop(context); // পপআপ বন্ধ করে গেম স্ক্রিনে নিয়ে যাবে
        Navigator.push(context, MaterialPageRoute(builder: (context) => targetScreen));
      },
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color, width: 1.5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 35, color: color),
            const SizedBox(height: 6),
            Text(
              title,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: color),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Live Voice & Video Room'),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
        actions: [
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

          // গেম জোন ওপেন করার শর্টকাট ব্যানার (এক ক্লিকে গেম পপআপ)
          Container(
            padding: const EdgeInsets.all(12),
            color: Colors.pink.shade50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Play Games in Group!', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.pink)),
                    Text('Click to open all games instantly.', style: TextStyle(fontSize: 11, color: Colors.grey)),
                  ],
                ),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () => _openGroupGameHub(context),
                  icon: const Icon(Icons.games, size: 18),
                  label: const Text('Open Games'),
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
                  },
                  icon: Icon(isMuted ? Icons.mic_off : Icons.mic, color: Colors.white),
                  style: IconButton.styleFrom(backgroundColor: isMuted ? Colors.red : Colors.grey.shade800),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      isVideoOn = !isVideoOn;
                    });
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
