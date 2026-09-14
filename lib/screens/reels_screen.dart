import 'package:flutter/material.dart';

class ReelsScreen extends StatelessWidget {
  const ReelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // মোট ৩টি ট্যাব: Nearby, Following, Trending
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            // ==========================================
            // ১. ব্যাকগ্রাউন্ড ভিডিও / রিলস কন্টেন্ট (Full Screen)
            // ==========================================
            PageView.builder(
              scrollDirection: Axis.vertical,
              itemCount: 5, // উদাহরণস্বরূপ ৫টি ভিডিও
              itemBuilder: (context, index) {
                return Stack(
                  fit: StackFit.expand,
                  children: [
                    // ভিডিওর পরিবর্তে প্লেসহোল্ডার ব্যাকগ্রাউন্ড (এখানে আপনার VideoPlayer বসবে)
                    Container(
                      color: Colors.grey.shade900,
                      child: const Center(
                        child: Icon(
                          Icons.play_circle_fill,
                          color: Colors.white54,
                          size: 80,
                        ),
                      ),
                    ),

                    // নিচের গ্রেডিয়েন্ট শ্যাডো (টেক্সট স্পষ্ট দেখার জন্য)
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
                            colors: [
                              Colors.black.withOpacity(0.8),
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),
                    ),

                    // ==========================================
                    // ২. ডান পাশের ইন্টারঅ্যাক্টিভ বাটনগুলো (Like, Comment, Share, Profile)
                    // ==========================================
                    Positioned(
                      right: 12,
                      bottom: 80,
                      child: Column(
                        children: [
                          // ক. প্রোফাইল বা প্লাস বাটন (ক্লিক করলে প্রোফাইলে যাবে)
                          GestureDetector(
                            onTap: () {
                              // TODO: ইউজারের প্রোফাইলে যাওয়ার নেভিগেশন
                            },
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                const CircleAvatar(
                                  radius: 22,
                                  backgroundColor: Colors.white,
                                  child: CircleAvatar(
                                    radius: 20,
                                    backgroundImage: NetworkImage('https://via.placeholder.com/150'), // ইউজারের ছবি
                                  ),
                                ),
                                Positioned(
                                  bottom: -4,
                                  right: 12,
                                  child: Container(
                                    height: 18,
                                    width: 18,
                                    decoration: const BoxDecoration(
                                      color: Colors.pink,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(Icons.add, color: Colors.white, size: 12),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 24),

                          // খ. লাইক বাটন
                          const Column(
                            children: [
                              Icon(Icons.favorite, color: Colors.white, size: 35),
                              SizedBox(height: 4),
                              Text('131', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
                            ],
                          ),
                          const SizedBox(height: 20),

                          // গ. কমেন্ট বাটন
                          const Column(
                            children: [
                              Icon(Icons.comment, color: Colors.white, size: 32),
                              SizedBox(height: 4),
                              Text('72', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
                            ],
                          ),
                          const SizedBox(height: 20),

                          // ঘ. শেয়ার বাটন
                          const Column(
                            children: [
                              Icon(Icons.share, color: Colors.white, size: 32),
                              SizedBox(height: 4),
                              Text('Share', style: TextStyle(color: Colors.white, fontSize: 12)),
                            ],
                          ),
                        ],
                      ),
                    ),

                    // ==========================================
                    // ৩. নিচের দিকে ইউজারের নাম, ফলো বাটন ও ক্যাপশন
                    // ==========================================
                    Positioned(
                      left: 16,
                      bottom: 70,
                      right: 80,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // ইউজারের নাম ও Follow বাটন
                          Row(
                            children: [
                              const Text(
                                'জীবন মানেই যন্ত্রনা',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(width: 10),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white, width: 1),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: const Text(
                                    'Follow',
                                    style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          // ভিডিওর ক্যাপশন বা টেক্সট
                          const Text(
                            'এই রকমের ভাগ্য কয়জনের আছে বল কার সাথে খাবার খাইতেছি দেখোছো আরে একে কমেন্ট বক্সে বলে দাও',
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

            // ==========================================
            // ৪. ওপরের টপ বার (Back Button & Nearby, Following, Trending Tabs)
            // ==========================================
            Positioned(
              top: 40,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const Expanded(
                      child: TabBar(
                        indicatorColor: Colors.white,
                        indicatorWeight: 3,
                        labelColor: Colors.white,
                        unselectedLabelColor: Colors.white60,
                        labelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
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
