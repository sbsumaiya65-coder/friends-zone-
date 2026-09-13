import 'package:flutter/material.dart';

void main() {
  // যেহেতু আমরা ফায়ারবেস কনফিগারেশন ছাড়াই অ্যাপ রান করতে চাচ্ছি, 
  // তাই Firebase.initializeApp(); লাইনটি এখানে দিচ্ছি না।
  runApp(const FriendsZoneApp());
}

class FriendsZoneApp extends StatelessWidget {
  const FriendsZoneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Friends Zone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      // সরাসরি আপনার অ্যাপের মূল হোম পেজ বা ড্যাশবোর্ড স্ক্রিনটি সেট করে দিন
      home: const MainDashboardScreen(),
    );
  }
}

// এটি আপনার মূল ফিচার বা হোম স্ক্রিনের ডেমো উইজেট
class MainDashboardScreen extends StatelessWidget {
  const MainDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Friends Zone (Testing)'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'স্বাগতম! আপনার অ্যাপ সফলভাবে ওপেন হয়েছে।',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // এখানে আপনার অ্যাপের মূল ফিচারগুলো টেস্ট করতে পারেন
                print('Main Feature Clicked');
              },
              child: const Text('মেইন ফিচার চেক করুন'),
            ),
          ],
        ),
      ),
    );
  }
}
