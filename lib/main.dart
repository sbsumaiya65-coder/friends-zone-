import 'package:flutter/material.dart';
import 'screens/auth_screen.dart';
import 'screens/main_navigation.dart';
import 'screens/tictactoe_screen.dart';

void main() {
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
        '/': (context) => const MainNavigation(),
        '/tictactoe': (context) => const TicTacToeScreen(),
      },
    );
  }
}
