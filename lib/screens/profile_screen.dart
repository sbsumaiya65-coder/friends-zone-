import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // কালো হয়ে যাওয়া স্ক্রিন সমস্যার সমাধান
      body: ListView(
        children: [
          // কাভার ফটো ও প্রোফাইল হেডার
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(
                height: 150,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [Colors.purple, Colors.pink]),
                ),
              ),
              Positioned(
                bottom: -40,
                left: 20,
                child: CircleAvatar(
                  radius: 45,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 42,
                    backgroundColor: Colors.pink[100],
                    child: const Icon(Icons.person, size: 50, color: Colors.white),
                  ),
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
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Text(
                  '@biplob.hossain.billal',
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
                const SizedBox(height: 10),
                Row(
                  children: const [
                    Text('308 followers', style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(width: 15),
                    Text('318 following', style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(width: 15),
                    Text('247 friends', style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 10),
                const Text(
                  'Friends Zone-এর সাথে যুক্ত থাকুন! নতুন মুহূর্ত, ছবি ও ভিডিও শেয়ার করুন এবং বন্ধুদের সাথে চ্যাট করুন। 💛✨',
                  style: TextStyle(fontSize: 13),
                ),
                const SizedBox(height: 15),
                
                // টেক্সট ভেঙে যাওয়া (Layout Overflow) রোধ করার জন্য Expanded ব্যবহার করা হয়েছে
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
                        onPressed: () {},
                        child: const Text('Edit Profile', style: TextStyle(color: Colors.white)),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      flex: 1,
                      child: OutlinedButton(
                        onPressed: () {},
                        child: const Text('Post', style: TextStyle(fontSize: 12)),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      flex: 1,
                      child: OutlinedButton(
                        onPressed: () {},
                        child: const Text('Promote', style: TextStyle(fontSize: 11)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Divider(),
                // ট্যাব অপশন (Posts, Reels, Stories)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Tab(child: Text('Posts', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.pink))),
                    Tab(child: Text('Reels / Feels', style: TextStyle(color: Colors.grey))),
                    Tab(child: Text('Stories', style: TextStyle(color: Colors.grey))),
                  ],
                ),
                const Divider(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
