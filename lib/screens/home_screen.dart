import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Friends Zone Feed'),
        backgroundColor: const Color(0xFF1E1E30),
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(10.0),
        children: [
          // Stories & Quick Profiles Section
          SizedBox(
            height: 90,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 6),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.pink[200],
                        child: const Icon(Icons.person, color: Colors.white),
                      ),
                      const SizedBox(height: 4),
                      Text('User $index', style: const TextStyle(fontSize: 12)),
                    ],
                  ),
                );
              },
            ),
          ),
          const Divider(),
          
          // Feed Posts Placeholder
          Card(
            elevation: 2,
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.grey,
                        child: Icon(Icons.person, color: Colors.white),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Biplob Hossain', style: TextStyle(fontWeight: FontWeight.bold)),
                          Text('Ishwardi, Pabna', style: TextStyle(fontSize: 11, color: Colors.grey)),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Text('Welcome to Friends Zone! Enjoy connecting with your friends and sharing moments.'),
                  const SizedBox(height: 12),
                  // সঠিক সিনট্যাক্স ব্যবহার করে কালার ফিক্স করা হয়েছে (Colors.pink[300])
                  Container(
                    height: 180,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.pink[300], // এখানে আগে pink300 ছিল যা ঠিক করা হয়েছে
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Icon(Icons.image, size: 50, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Icon.featured(Icons.thumb_up_outlined, label: 'Like'),
                      Icon.featured(Icons.comment_outlined, label: 'Comment'),
                      Icon.featured(Icons.share_outlined, label: 'Share'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Helper widget for post actions
extension on IconData {
  Widget featured({required IconData icons, required String label}) {
    return TextButton.icon(
      onPressed: () {},
      icon: Icon(icons, size: 20, color: Colors.grey),
      label: Text(label, style: const TextStyle(color: Colors.grey)),
    );
  }
}
