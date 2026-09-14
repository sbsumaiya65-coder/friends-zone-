import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // বটম নেভিগেশনের জন্য বর্তমান ইন্ডেক্স
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      
      // ==========================================
      // ১. টপ অ্যাপ বার (Top App Bar)
      // ==========================================
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: const Text(
          'Friends Zone', // আপনার অ্যাপের নাম
          style: TextStyle(
            color: Colors.pink,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined, color: Colors.black87),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black87),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.chat_bubble_outline, color: Colors.black87),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.black87),
            onPressed: () {},
          ),
        ],
      ),

      // ==========================================
      // ২. মূল ফিড বডি (Body Content)
      // ==========================================
      body: ListView(
        children: [
          // ক. স্ট্যাটাস বা পোস্ট লেখার বক্স ("What's on your mind?")
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.pink.shade100,
                  child: Icon(Icons.person, color: Colors.pink),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Text(
                      "What's on your mind?",
                      style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.photo_library, color: Colors.blue, size: 28),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),

          // খ. স্টোরিজ সেকশন (Stories Section)
          Container(
            height: 100,
            color: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              children: [
                _buildStoryItem('Create story', Icons.add, isCreate: true),
                _buildStoryItem('Md Sojibu...', Icons.person),
                _buildStoryItem('Md. Ripon...', Icons.person),
                _buildStoryItem('Md Rimo...', Icons.person),
                _buildStoryItem('MD Roni...', Icons.person),
              ],
            ),
          ),
          const SizedBox(height: 8),

          // গ. নিউজ ফিড পোস্ট (News Feed Post Card)
          Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // পোস্টের মাথার অংশ (ইউজার প্রোফাইল ও নাম)
                ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: Colors.pink,
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                  title: Row(
                    children: const [
                      Text('Shah Jahid', style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(width: 6),
                      Text('• Follow', style: TextStyle(color: Colors.pink, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  subtitle: const Text('16 days ago'),
                  trailing: const Icon(Icons.more_horiz),
                ),
                
                // পোস্টের ক্যাপশন টেক্সট
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: Text('সবাইকে জানাই শুভ বিকাল 💛'),
                ),
                const SizedBox(height: 8),

                // পোস্টের ছবি বা মিডিয়া
                Container(
                  height: 300,
                  width: double.infinity,
                  color: Colors.grey.shade300,
                  child: const Center(
                    child: Icon(Icons.image, size: 80, color: Colors.grey),
                  ),
                ),
                
                // লাইক, কমেন্ট ও শেয়ার সেকশন
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Row(
                        children: [
                          Icon(Icons.favorite, color: Colors.pink, size: 20),
                          SizedBox(width: 6),
                          Text('131', style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Text('12 Comments • 3 Shares', style: TextStyle(color: Colors.grey, fontSize: 12)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      // ==========================================
      // ৩. বটম নেভিগেশন বার ও মাঝখানের প্লাস (+) বাটন
      // ==========================================
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home, color: _currentIndex == 0 ? Colors.pink : Colors.grey),
              onPressed: () => setState(() => _currentIndex = 0),
            ),
            IconButton(
              icon: Icon(Icons.video_collection, color: _currentIndex == 1 ? Colors.pink : Colors.grey),
              onPressed: () => setState(() => _currentIndex = 1),
            ),
            const SizedBox(width: 40), // মাঝখানের প্লাস বাটনের জন্য ফাঁকা জায়গা
            IconButton(
              icon: Icon(Icons.group, color: _currentIndex == 3 ? Colors.pink : Colors.grey),
              onPressed: () => setState(() => _currentIndex = 3),
            ),
            IconButton(
              icon: Icon(Icons.person, color: _currentIndex == 4 ? Colors.pink : Colors.grey),
              onPressed: () => setState(() => _currentIndex = 4),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        child: const Icon(Icons.add, color: Colors.white, size: 28),
        onPressed: () {
          // একটু আগে তৈরি করা Create বটম শীটটি এখানে কল হবে
          _showCreateBottomSheet(context);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  // স্টোরি আইটেম তৈরির হেল্পার উইজেট
  Widget _buildStoryItem(String name, IconData icon, {bool isCreate = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.pink, width: 2),
            ),
            child: CircleAvatar(
              radius: 26,
              backgroundColor: isCreate ? Colors.white : Colors.pink.shade100,
              child: Icon(icon, color: Colors.pink, size: isCreate ? 24 : 28),
            ),
          ),
          const SizedBox(height: 4),
          SizedBox(
            width: 65,
            child: Text(
              name,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 11),
            ),
          ),
        ],
      ),
    );
  }

  // 'Create' পপ-আপ বটম শীট ফাংশন (আগের কোড থেকে)
  void _showCreateBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 30),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const Text(
                'Create',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black87),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildCreateItemModal(Icons.grid_view_rounded, 'Post', () => Navigator.pop(context)),
                  _buildCreateItemModal(Icons.add_circle, 'Zone Story', () => Navigator.pop(context)),
                  _buildCreateItemModal(Icons.video_collection, 'Feels', () => Navigator.pop(context)),
                  _buildCreateItemModal(Icons.touch_app, 'Flick', () => Navigator.pop(context)),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCreateItemModal(IconData icon, String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            height: 65,
            width: 65,
            decoration: BoxDecoration(
              color: Colors.pink.shade50,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.pink.shade100, width: 1),
            ),
            child: Icon(icon, color: Colors.pink, size: 28),
          ),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}
