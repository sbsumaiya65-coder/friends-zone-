import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // সোশ্যাল ক্যাটাগরি ফিল্টার ট্যাব স্টেট
  String _selectedTab = 'Posts';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          // ==========================================
          // ধাপ ১: কভার ফটো এবং টপ অ্যাপ বার আইকনসমূহ
          // ==========================================
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: 180,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.pink.shade400, Colors.purple.shade700],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.black.withOpacity(0.3),
                          child: IconButton(
                            icon: const Icon(Icons.menu, color: Colors.white),
                            onPressed: () {
                              _showActionMessage(context, 'Menu tapped');
                            },
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.black.withOpacity(0.3),
                          child: IconButton(
                            icon: const Icon(Icons.settings, color: Colors.white),
                            onPressed: () {
                              _showActionMessage(context, 'Settings tapped');
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 110,
                right: 16,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black87,
                    elevation: 2,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  ),
                  icon: const Icon(Icons.camera_alt, size: 16, color: Colors.pink),
                  label: const Text('Edit Cover', style: TextStyle(fontSize: 12)),
                  onPressed: () {
                    _showActionMessage(context, 'Edit Cover clicked');
                  },
                ),
              ),

              // ==========================================
              // ধাপ ২: প্রোফাইল পিকচার, ইউজারনেম, স্ট্যাটিস্টিক্স ও বায়ো
              // ==========================================
              Positioned(
                bottom: -45,
                left: 16,
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 45,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 42,
                        backgroundColor: Colors.pink.shade100,
                        child: const Icon(Icons.person, size: 50, color: Colors.pink),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: const BoxDecoration(
                          color: Colors.pink,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.camera_alt, size: 14, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 50),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'BIPLOB HOSSAIN BILLAL',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black87),
                ),
                const SizedBox(height: 2),
                Text(
                  '@biplob.hossain.billal',
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade600, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 12),

                Row(
                  children: [
                    _buildStatItem('308', 'followers'),
                    const SizedBox(width: 20),
                    _buildStatItem('318', 'following'),
                    const SizedBox(width: 20),
                    _buildStatItem('247', 'friends'),
                  ],
                ),
                const SizedBox(height: 12),

                const Text(
                  'Friends Zone-এর সাথে যুক্ত থাকুন! নতুন মুহূর্ত, ছবি ও ভিডিও শেয়ার করুন এবং বন্ধুদের সাথে চ্যাট করুন। 💛✨',
                  style: TextStyle(fontSize: 14, color: Colors.black87, height: 1.4),
                ),
                const SizedBox(height: 16),

                // ==========================================
                // ধাপ ৩: প্রধান অ্যাকশন বাটনসমূহ (Edit Profile ইত্যাদি)
                // ==========================================
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pink,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                        onPressed: () {
                          _showActionMessage(context, 'Edit Profile clicked');
                        },
                        child: const Text('Edit Profile', style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          side: BorderSide(color: Colors.grey.shade300),
                        ),
                        onPressed: () {
                          _showActionMessage(context, 'Post clicked');
                        },
                        child: const Text('Post', style: TextStyle(color: Colors.black87)),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          side: BorderSide(color: Colors.grey.shade300),
                        ),
                        onPressed: () {
                          _showActionMessage(context, 'Promote clicked');
                        },
                        child: const Text('Promote', style: TextStyle(color: Colors.black87)),
                      ),
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      style: IconButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(color: Colors.grey.shade300),
                        ),
                      ),
                      icon: const Icon(Icons.more_horiz, color: Colors.black87),
                      onPressed: () {
                        _showActionMessage(context, 'More options clicked');
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // ==========================================
                // ধাপ ৪: সোশ্যাল এনগেজমেন্ট ব্যানার (Share Your Stories)
                // ==========================================
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.pink.shade200, width: 1.5),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.pink.shade50,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.auto_awesome, color: Colors.pink),
                      ),
                      const SizedBox(width: 12),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Share Your Daily Stories',
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black87),
                            ),
                            SizedBox(height: 2),
                            Text(
                              'Go live, upload reels & connect with friends instantly',
                              style: TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                      const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.pink),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // ==========================================
                // ধাপ ৫: সোশ্যাল ফিল্টার ট্যাবসমূহ (Posts, Reels ইত্যাদি)
                // ==========================================
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildFilterTab('Posts', Icons.grid_on),
                      _buildFilterTab('Reels / Feels', Icons.video_collection),
                      _buildFilterTab('Stories', Icons.history_edu),
                      _buildFilterTab('Photos', Icons.photo_library),
                      _buildFilterTab('Tagged', Icons.person_pin),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // ==========================================
                // ধাপ ৬: ব্যক্তিগত বিবরণ (Personal Details) ও এডিট অপশন
                // ==========================================
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Personal details',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                            icon: const Icon(Icons.edit, size: 18, color: Colors.grey),
                            onPressed: () {
                              _showActionMessage(context, 'Edit Personal Details clicked');
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      _buildDetailRow(Icons.location_on_outlined, 'Rajshahi Division, Bangladesh'),
                      const SizedBox(height: 8),
                      _buildDetailRow(Icons.favorite_outline, 'Active in Friends Zone Community'),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // হেল্পার উইজেট: স্ট্যাটাস কাউন্ট আইটেম
  Widget _buildStatItem(String count, String label) {
    return Row(
      children: [
        Text(count, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
        const SizedBox(width: 4),
        Text(label, style: TextStyle(color: Colors.grey.shade600, fontSize: 13)),
      ],
    );
  }

  // হেল্পার উইজেট: ফিল্টার ট্যাব আইটেম
  Widget _buildFilterTab(String title, IconData icon) {
    bool isSelected = _selectedTab == title;
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: FilterChip(
        avatar: Icon(icon, size: 16, color: isSelected ? Colors.white : Colors.pink),
        label: Text(title),
        selected: isSelected,
        selectedColor: Colors.pink,
        labelStyle: TextStyle(
          color: isSelected ? Colors.white : Colors.black87,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: isSelected ? Colors.pink : Colors.grey.shade300),
        ),
        onSelected: (bool selected) {
          setState(() {
            _selectedTab = title;
          });
        },
      ),
    );
  }

  // হেল্পার উইজেট: পার্সোনাল ডিটেইলস রো
  Widget _buildDetailRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 18, color: Colors.grey.shade700),
        const SizedBox(width: 10),
        Text(text, style: const TextStyle(fontSize: 13, color: Colors.black87)),
      ],
    );
  }

  // স্নাকবার মেসেজ দেখানোর ফাংশন
  void _showActionMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), duration: const Duration(seconds: 1)),
    );
  }
}
