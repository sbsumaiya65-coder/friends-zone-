import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0B15), // Deep Dark Premium BG
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F0B15),
        elevation: 0,
        title: Row(
          children: const [
            Text(
              'FZ',
              style: TextStyle(
                color: Colors.pinkAccent,
                fontWeight: FontWeight.bold,
                fontSize: 24,
                letterSpacing: 0.5,
              ),
            ),
            SizedBox(width: 8),
            Text(
              'Friends Zone',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white, size: 24),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.white, size: 24),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          // 1. What's on your mind box
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: const Color(0xFF1E1629),
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: Colors.pink.withOpacity(0.3), width: 1),
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
                  style: TextStyle(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w400),
                ),
                Spacer(),
                Icon(Icons.camera_alt, color: Colors.pinkAccent, size: 22),
              ],
            ),
          ),

          const SizedBox(height: 4),

          // 2. Stories Row (Pixel-for-pixel Gradient Border)
          SizedBox(
            height: 105,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: 7,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(left: index == 0 ? 12 : 6, right: 6),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(2.5),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: const LinearGradient(
                            colors: [Colors.pink, Colors.purple, Colors.orange],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: const Color(0xFF0F0B15),
                          child: CircleAvatar(
                            radius: 28,
                            backgroundColor: Colors.grey[900],
                            child: Icon(
                              index == 0 ? Icons.add : Icons.person,
                              color: index == 0 ? Colors.pinkAccent : Colors.white70,
                              size: index == 0 ? 28 : 26,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        index == 0 ? 'Create Story' : 'User $index',
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          const Divider(color: Colors.white12, thickness: 1, height: 16),

          // 3. Feed Post Card
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFF1A1325),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.pink.withOpacity(0.2), width: 1),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Post Header
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
                        Row(
                          children: [
                            Text(
                              'Biplob Hossain',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(width: 4),
                            Icon(Icons.verified, color: Colors.pinkAccent, size: 14),
                          ],
                        ),
                        SizedBox(height: 2),
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
                const SizedBox(height: 12),
                
                // Post Caption
                const Text(
                  'শুভ সন্ধ্যা 🌅 যাই হয়ে থাকুক কেন মুখে হাসি রাখতে হবে ❤️\n#FriendsZone #Ishwardi',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 12),

                // Post Image Container
                Container(
                  height: 220,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.purple.shade900,
                    borderRadius: BorderRadius.circular(12),
                    gradient: LinearGradient(
                      colors: [Colors.purple.shade900, Colors.pink.shade900],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: const Center(
                    child: Icon(Icons.image, size: 60, color: Colors.white54),
                  ),
                ),
                const SizedBox(height: 8),

                // Post Action Buttons (Like, Comment, Share)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.thumb_up_alt_outlined, color: Colors.pinkAccent, size: 18),
                      label: const Text('Like', style: TextStyle(color: Colors.white70, fontSize: 13)),
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.comment_outlined, color: Colors.grey, size: 18),
                      label: const Text('Comment', style: TextStyle(color: Colors.white70, fontSize: 13)),
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.share_outlined, color: Colors.grey, size: 18),
                      label: const Text('Share', style: TextStyle(color: Colors.white70, fontSize: 13)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
