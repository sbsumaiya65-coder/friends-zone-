import 'package:flutter/material.dart';
import 'screens/main_app_screen.dart';

void main() {
  runApp(const FriendsZoneApp());
}

class FriendsZoneApp extends StatelessWidget {
  const FriendsZoneApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Friends Zone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1E1E30),
          foregroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      // এখানে মেইন স্ক্রিন কল করা হয়েছে (const সরিয়ে দেওয়া হয়েছে যাতে বিল্ড এরর না আসে)
      home: MainAppScreen(),
    );
  }
}
