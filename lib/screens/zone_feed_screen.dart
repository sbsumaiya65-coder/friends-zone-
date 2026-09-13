import 'package:flutter/material.dart';
import '../coin_referral_manager.dart';

class ZoneFeedScreen extends StatefulWidget {
  const ZoneFeedScreen({super.key});

  @override
  State<ZoneFeedScreen> createState() => _ZoneFeedScreenState();
}

class _ZoneFeedScreenState extends State<ZoneFeedScreen> {
  final TextEditingController _postController = TextEditingController();

  // ডেমো ফিড পোস্ট লিস্ট
  final List<Map<String, dynamic>> posts = [
    {
      'name': 'Biplob Hossain Billal',
      'time': '10 mins ago',
      'content': 'Welcome to Friends Zone! Enjoy proximity chatting and offline sharing.',
      'likes': 12,
      'comments': 4,
      'shares': 5,
      'isLiked': false,
    },
    {
      'name': 'Nusrat Jahan',
      'time': '1 hour ago',
      'content': 'Scanning nearby friends using GPS Radar is super cool! 🚀',
      'likes': 25,
      'comments': 8,
      'shares': 10,
      'isLiked': true,
    },
  ];

  void _addNewPost() {
    if (_postController.text.trim().isEmpty) return;
    setState(() {
      posts.insert(0, {
        'name': 'Biplob Hossain Billal',
        'time': 'Just now',
        'content': _postController.text.trim(),
        'likes': 0,
        'comments': 0,
        'shares': 0,
        'isLiked': false,
      });
      _postController.clear();
    });
    // পোস্ট করার জন্য বোনাস কয়েন বা রিওয়ার্ড
    CoinReferralManager.earnCoins('share', context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zone Feed & Posts'),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  '🪙 ${CoinReferralManager.userCoins} Coins',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // নতুন পোস্ট লেখার বক্স (Facebook Style)
          Container(
            padding: const EdgeInsets.all(12.0),
            color: Colors.white,
            child: Column(
              children: [
                TextField(
                  controller: _postController,
                  decoration: InputDecoration(
                    hintText: 'What\'s on your mind? Share photos, videos...',
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  ),
                  maxLines: 2,
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.image, color: Colors.pink),
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Photo/Video upload feature activated!')),
                            );
                          },
                        ),
                        const Text('Photo/Video', style: TextStyle(color: Colors.grey, fontSize: 13)),
                      ],
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                      ),
                      onPressed: _addNewPost,
                      child: const Text('Post'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(height: 1, thickness: 1),

          // ফিড পোস্ট লিস্ট
          Expanded(
            child: ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                  elevation: 2,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const CircleAvatar(
                              backgroundColor: Colors.pinkAccent,
                              child: Icon(Icons.person, color: Colors.white),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(post['name'], style: const TextStyle(fontWeight: FontWeight.bold)),
                                Text(post['time'], style: const TextStyle(color: Colors.grey, fontSize: 11)),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(post['content'], style: const TextStyle(fontSize: 15)),
                        const SizedBox(height: 12),
                        const Divider(height: 1),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            // Like Button (+1 Coin)
                            TextButton.icon(
                              onPressed: () {
                                setState(() {
                                  post['isLiked'] = !post['isLiked'];
                                  if (post['isLiked']) {
                                    post['likes']++;
                                    CoinReferralManager.earnCoins('like', context);
                                  } else {
                                    post['likes']--;
                                  }
                                });
                              },
                              icon: Icon(
                                post['isLiked'] ? Icons.thumb_up : Icons.thumb_up_alt_outlined,
                                color: post['isLiked'] ? Colors.pink : Colors.grey,
                              ),
                              label: Text('${post['likes']} Likes', style: TextStyle(color: post['isLiked'] ? Colors.pink : Colors.grey)),
                            ),
                            // Comment Button (+2 Coins)
                            TextButton.icon(
                              onPressed: () {
                                CoinReferralManager.earnCoins('comment', context);
                              },
                              icon: const Icon(Icons.comment_outlined, color: Colors.grey),
                              label: Text('${post['comments']} Comments', style: const TextStyle(color: Colors.grey)),
                            ),
                            // Share Button (+5 Coins)
                            TextButton.icon(
                              onPressed: () {
                                CoinReferralManager.earnCoins('share', context);
                              },
                              icon: const Icon(Icons.share_outlined, color: Colors.grey),
                              label: Text('${post['shares']} Shares', style: const TextStyle(color: Colors.grey)),
                            ),
                          ],
                        )
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
