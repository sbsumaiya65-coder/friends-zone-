import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0B15),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F0B15),
        elevation: 0,
        title: Row(
          children: const [
            Text(
              'FZ',
              style: TextStyle(color: Colors.pinkAccent, fontWeight: FontWeight.bold, fontSize: 24),
            ),
            SizedBox(width: 8),
            Text(
              'Friends Zone',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          // What's on your mind box
          Container(
            margin: const EdgeInsets.all(12),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: const Color(0xFF1E1629),
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: Colors.pink.withOpacity(0.3)),
            ),
            child: Row(
              children: const [
                CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.pink,
                  child: Icon(Icons.person, color: Colors.white, size: 20),
                ),
                SizedBox(width: 12),
                Text(
                  "What's on your mind?",
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
                Spacer(),
                Icon(Icons.camera_alt, color: Colors.pinkAccent),
              ],
            ),
          ),

          // Stories Row
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(2),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [Colors.pink, Colors.purple, Colors.orange],
                          ),
                        ),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.black,
                          child: Icon(
                            index == 0 ? Icons.add : Icons.person,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        index == 0 ? 'Create Story' : 'User $index',
                        style: const TextStyle(color: Colors.white70, fontSize: 11),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          const Divider(color: Colors.white12),

          // Feed Post Card
          Container(
            margin: const EdgeInsets.all(12),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFF1A1325),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.pink.withOpacity(0.2)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.pink,
                      child: Icon(Icons.person, color: Colors.white),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Biplob Hossain',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Ishwardi, Pabna • Just now',
                          style: TextStyle(color: Colors.grey, fontSize: 11),
                        ),
                      ],
                    ),
                    const Spacer(),
                    const Icon(Icons.more_vert, color: Colors.grey),
                  ],
                ),
                const SizedBox(height: 10),
                const Text(
                  'শুভ সন্ধ্যা 🌅 যাই হয়ে থাকুক কেন মুখে হাসি রাখতে হবে ❤️ #FriendsZone #Ishwardi',
                  style: TextStyle(color: Colors.white, fontSize: 13),
                ),
                const SizedBox(height: 10),
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.purple.shade900,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                    child: Icon(Icons.image, size: 60, color: Colors.white54),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.thumb_up_alt_outlined, color: Colors.pinkAccent, size: 18),
                      label: const Text('Like', style: TextStyle(color: Colors.white70)),
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.comment_outlined, color: Colors.grey, size: 18),
                      label: const Text('Comment', style: TextStyle(color: Colors.white70)),
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.share_outlined, color: Colors.grey, size: 18),
                      label: const Text('Share', style: TextStyle(color: Colors.white70)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
