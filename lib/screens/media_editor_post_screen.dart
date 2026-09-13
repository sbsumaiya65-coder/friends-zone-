import 'package:flutter/material.dart';
import '../coin_referral_manager.dart';
import '../widgets/fz_coin_badge.dart';

class MediaEditorPostScreen extends StatefulWidget {
  const MediaEditorPostScreen({super.key});

  @override
  State<MediaEditorPostScreen> createState() => _MediaEditorPostScreenState();
}

class _MediaEditorPostScreenState extends State<MediaEditorPostScreen> {
  final TextEditingController _captionController = TextEditingController();
  String selectedFilter = 'Normal';
  bool isProEnhanceActive = false;
  bool isAiStickerApplied = false;

  final List<String> filters = ['Normal', '🌟 Cyberpunk (PRO)', '💎 Diamond Glow', '🔥 Cinematic', '🌸 Vintage Soft'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('✨ Pro Media Editor & Post'),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: FZCoinBadge(coinAmount: CoinReferralManager.userCoins),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // প্রিভিউ বক্স (মিডিয়া প্রিভিউ)
            Container(
              height: 220,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.pink.shade200, width: 2),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add_photo_alternate_rounded, size: 50, color: Colors.pink),
                      SizedBox(height: 8),
                      Text(
                        'Tap to Select Photo or Video',
                        style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  if (isAiStickerApplied)
                    const Positioned(
                      top: 16,
                      right: 16,
                      child: Chip(
                        backgroundColor: Colors.amber,
                        label: Text('👑 VIP Badge Active', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // এডিটিং টুলস ও প্রিমিয়াম ফিল্টার সেকশন
            const Text(
              'Select Pro Filter:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.pink),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 45,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filters.length,
                itemBuilder: (context, index) {
                  final filter = filters[index];
                  final isSelected = selectedFilter == filter;
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: ChoiceChip(
                      label: Text(filter),
                      selected: isSelected,
                      selectedColor: Colors.pink,
                      labelStyle: TextStyle(color: isSelected ? Colors.white : Colors.black87),
                      onSelected: (bool selected) {
                        setState(() {
                          selectedFilter = filter;
                        });
                      },
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),

            // প্রিমিয়াম ফিচার টগলস
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.pink.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  SwitchListTile(
                    title: const Text('AI 4K Video/Photo Enhancer', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                    subtitle: const Text('Automatically sharpens and balances colors', style: TextStyle(fontSize: 11)),
                    value: isProEnhanceActive,
                    activeColor: Colors.pink,
                    onChanged: (val) {
                      setState(() {
                        isProEnhanceActive = val;
                      });
                    },
                  ),
                  const Divider(height: 1),
                  SwitchListTile(
                    title: const Text('Apply VIP Frame & Sticker', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                    subtitle: const Text('Adds exclusive animated frame to media', style: TextStyle(fontSize: 11)),
                    value: isAiStickerApplied,
                    activeColor: Colors.pink,
                    onChanged: (val) {
                      setState(() {
                        isAiStickerApplied = val;
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // ক্যাপশন ইনপুট ফিল্ড
            TextField(
              controller: _captionController,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: 'Write something amazing about your post...',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 20),

            // পোস্ট করার বাটন
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Post published successfully with Pro Edits! 🚀')),
                );
                Navigator.pop(context);
              },
              child: const Text(
                'Publish Pro Post ✨',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
