import 'package:flutter/material.dart';

class MediaEditorPostScreen extends StatefulWidget {
  const MediaEditorPostScreen({super.key});

  @override
  State<MediaEditorPostScreen> createState() => _MediaEditorPostScreenState();
}

class _MediaEditorPostScreenState extends State<MediaEditorPostScreen> {
  String _selectedFilter = 'Normal';
  final TextEditingController _captionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('✨ Pro Media Editor'),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // মিডিয়া প্রিভিউ বক্স
          Container(
            height: 250,
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
                    Icon(Icons.add_photo_alternate, size: 64, color: Colors.pink),
                    SizedBox(height: 8),
                    Text(
                      'Tap to select photo or video for AI enhancement',
                      style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Positioned(
                  bottom: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'Active Filter: $_selectedFilter',
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // ক্যাপশন ইনপুট ফিল্ড
          TextField(
            controller: _captionController,
            decoration: InputDecoration(
              labelText: 'Write a catchy caption...',
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              prefixIcon: const Icon(Icons.edit, color: Colors.pink),
            ),
          ),
          const SizedBox(height: 20),

          // এআই ফিল্টার অপশনসমূহ
          const Text(
            'Choose AI Filters:',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildFilterButton('Normal', Icons.filter_none),
              _buildFilterButton('Vivid AI', Icons.auto_awesome),
              _buildFilterButton('Cyberpunk', Icons.bolt),
              _buildFilterButton('Vintage', Icons.camera_roll),
            ],
          ),
          const SizedBox(height: 30),

          // পোস্ট পাবলিশ করার বাটন (এখানে SizedBox ব্যবহার করা হয়েছে সঠিক নিয়মে, কোনো onPressed ছাড়াই)
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              icon: const Icon(Icons.send),
              label: const Text('Publish Post to FZ Zone 🚀', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('🎉 Post published successfully with AI filters!'),
                    backgroundColor: Colors.green,
                  ),
                );
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterButton(String filterName, IconData icon) {
    bool isSelected = _selectedFilter == filterName;
    return InkWell(
      onTap: () {
        setState(() {
          _selectedFilter = filterName;
        });
      },
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.pink.shade100 : Colors.grey.shade100,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: isSelected ? Colors.pink : Colors.grey.shade300, width: 2),
        ),
        child: Column(
          children: [
            Icon(icon, color: isSelected ? Colors.pink : Colors.grey),
            const SizedBox(height: 4),
            Text(
              filterName,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: isSelected ? Colors.pink : Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
}
