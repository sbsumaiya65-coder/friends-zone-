import 'package:flutter/material.dart';
import 'screens/auth_screen.dart';
import 'screens/main_app_screen.dart'; // মেইন নেভিগেশন শেল
import 'screens/tictactoe_screen.dart';
import 'screens/premium_hub_screen.dart'; // প্রিমিয়াম হাব স্ক্রিন
import 'screens/monthly_leaderboard_screen.dart'; // মাসিক লিডারবোর্ড ও রিওয়ার্ড স্ক্রিন

void main() {
  runApp(const FriendsZoneApp());
}

class FriendsZoneApp extends StatelessWidget {
  const FriendsZoneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Friends Zone - FZ',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.pink,
          foregroundColor: Colors.white,
        ),
      ),
      initialRoute: '/auth',
      routes: {
        '/auth': (context) => const AuthScreen(),
        '/': (context) => const MainAppScreen(), // মেইন নেভিগেশন
        '/premium_hub': (context) => const PremiumHubScreen(),
        '/tictactoe': (context) => const TicTacToeScreen(),
        '/leaderboard': (context) => const MonthlyLeaderboardScreen(), // মাসিক ক্রিয়েটর লিডারবোর্ড রাউট
      },
    );
  }
}
