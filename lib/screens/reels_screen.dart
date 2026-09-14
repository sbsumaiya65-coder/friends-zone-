import 'package:flutter/material.dart';

class ReelsScreen extends StatelessWidget {
  const ReelsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Center(
                child: Text(
                  'FZ Reels & Feels Video ${index + 1}',
                  style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Positioned(
                bottom: 40,
                left: 20,
                right: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('@biplob.hossain', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                    SizedBox(height: 8),
                    Text('Exploring the amazing features of Friends Zone app! 🔥', style: TextStyle(color: Colors.white70)),
                  ],
                ),
              ),
              Positioned(
                right: 20,
                bottom: 60,
                child: Column(
                  children: const [
                    Icon(Icons.favorite, color: Colors.white, size: 35),
                    SizedBox(height: 15),
                    Icon(Icons.comment, color: Colors.white, size: 35),
                    SizedBox(height: 15),
                    Icon(Icons.share, color: Colors.white, size: 35),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
