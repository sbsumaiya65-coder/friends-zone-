import 'package:flutter/material.dart';

class ReelsScreen extends StatelessWidget {
  const ReelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Nearby, Following, Trending
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            // ভিডিও ফিড পেজ ভিউ
            PageView.builder(
              scrollDirection: Axis.vertical,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Stack(
                  fit: StackFit.expand,
                  children: [
                    // ভিডিও ব্যাকগ্রাউন্ড প্লেসহোল্ডার
                    Container(
                      color: Colors.grey.shade900,
                      child: const Center(
                        child: Icon(Icons.play_circle_fill, color: Colors.white54, size: 80),
                      ),
                    ),

                    // গ্রেডিয়েন্ট ওভারলে
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      height: 250,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [Colors.black.withOpacity(0.8), Colors.transparent],
                          ),
                        ),
                      ),
                    ),

                    // ডান পাশের অ্যাকশন বাটন (প্রোফাইল, লাইক, কমেন্ট, শেয়ার)
                    Positioned(
                      right: 12,
                      bottom: 80,
                      child: Column(
                        children: [
                          // প্রোফাইল বাটন ও প্লাস আইকন
                          GestureDetector(
                            onTap: () {},
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                const CircleAvatar(
                                  radius: 22,
                                  backgroundColor: Colors.white,
                                  child: Icon(Icons.person, color: Colors.pink, size: 24),
                                ),
                                Positioned(
                                  bottom: -2,
                                  right: 10,
                                  child: Container(
                                    height: 16,
                                    width: 16,
                                    decoration: const BoxDecoration(
                                      color: Colors.pink,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(Icons.add, color: Colors.white, size: 10),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 22),

                          // লাইক বাটন
                          const Column(
                            children: [
                              Icon(Icons.favorite, color: Colors.white, size: 32),
                              SizedBox(height: 4),
                              Text('131', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
                            ],
                          ),
                          const SizedBox(height: 18),

                          // কমেন্ট বাটন
                          const Column(
                            children: [
                              Icon(Icons.comment, color: Colors.white, size: 30),
                              SizedBox(height: 4),
                              Text('72', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
                            ],
                          ),
                          const SizedBox(height: 18),

                          // শেয়ার বাটন
                          const Column(
                            children: [
                              Icon(Icons.share, color: Colors.white, size: 30),
                              SizedBox(height: 4),
                              Text('Share', style: TextStyle(color: Colors.white, fontSize: 11)),
                            ],
                          ),
                        ],
                      ),
                    ),

                    // নিচের দিকে ইউজার ইনফো ও ক্যাপশন
                    Positioned(
                      left: 16,
                      bottom: 70,
                      right: 80,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text(
                                'জীবন মানেই যন্ত্রনা',
                                style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(width: 10),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white, width: 1),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: const Text(
                                  'Follow',
                                  style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),
                          const Text(
                            'এই রকমের ভাগ্য কয়জনের আছে বল কার সাথে খাবার খাইতেছি দেখোছো...',
                            style: TextStyle(color: Colors.white70, fontSize: 13),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),

            // ওপরের টপ বার (Nearby, Following, Trending ট্যাবসমূহ)
            Positioned(
              top: 40,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const Expanded(
                      child: TabBar(
                        indicatorColor: Colors.pink,
                        indicatorWeight: 3,
                        labelColor: Colors.white,
                        unselectedLabelColor: Colors.white60,
                        labelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                        tabs: [
                          Tab(text: 'Nearby'),
                          Tab(text: 'Following'),
                          Tab(text: 'Trending'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
