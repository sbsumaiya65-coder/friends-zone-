import 'package:flutter/material.dart';
import 'screens/auth_screen.dart';
import 'screens/home_screen.dart';
import 'screens/discover_screen.dart';
import 'screens/chats_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/main_navigation.dart';
import 'screens/group_room_screen.dart';
import 'screens/games_screen.dart';
import 'screens/tictactoe_screen.dart';
import 'screens/zone_feed_screen.dart';
import 'coin_referral_manager.dart';

void main() {
  runApp(const FriendsZoneApp());
}

class FriendsZoneApp extends StatelessWidget {
  const FriendsZoneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Friends Zone',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MainNavigation(),
        '/auth': (context) => const AuthScreen(),
        '/home': (context) => const HomeScreen(),
        '/discover': (context) => const DiscoverScreen(),
        '/chats': (context) => const ChatsScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/group_room': (context) => const GroupRoomScreen(),
        '/games': (context) => const GamesScreen(),
        '/tictactoe': (context) => const TicTacToeScreen(),
        '/zone_feed': (context) => const ZoneFeedScreen(),
      },
    );
  }
}
