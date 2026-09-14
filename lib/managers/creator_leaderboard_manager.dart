import 'dart:async';
import 'package:flutter/material.dart';
import '../coin_referral_manager.dart';

class CreatorLeaderboardManager {
  static Timer? _viewCoinTimer;
  static int currentStreamViews = 0;

  // ১. লাইভে থাকা অবস্থায় ভিউ অনুযায়ী প্রতি মিনিটে কয়েন বাড়ার লজিক
  static void startLiveStreamCoinAccumulator(VoidCallback onCoinUpdated) {
    _viewCoinTimer?.cancel();
    // প্রতি ১০ সেকেন্ড পর পর ভিউ ও পপুলারিটি অনুযায়ী কয়েন যোগ হবে (ডেমো হিসেবে)
    _viewCoinTimer = Timer.periodic(const Duration(seconds: 10), (timer) {
      if (currentStreamViews > 0) {
        int earnedCoins = (currentStreamViews * 0.1).toInt(); // ভিউ অনুযায়ী কয়েন ক্যালকুলেশন
        if (earnedCoins < 1) earnedCoins = 1;

        CoinReferralManager.userCoins += earnedCoins;
        onCoinUpdated(); // UI আপডেট করার জন্য
      }
    });
  }

  // লাইভ শেষ হলে বা বন্ধ হলে টাইমার স্টপ করার জন্য
  static void stopLiveStream() {
    _viewCoinTimer?.cancel();
    currentStreamViews = 0;
  }

  // ২. মাসিক সেরা ১০ জন ক্রিয়েটর এবং টপ ৩ জনের স্পেশাল পুরস্কারের লিস্ট
  static List<Map<String, dynamic>> getMonthlyLeaderboardData() {
    return [
      {'rank': 1, 'name': 'Biplob Hossain Billal', 'views': '125.4K', 'prize': '👑 5,000 FZ Coins + Gold VIP Animation & Special Gift'},
      {'rank': 2, 'name': 'Sumaiya Akter', 'views': '98.2K', 'prize': '🥈 3,000 FZ Coins + Silver Badge & Pro Filter'},
      {'rank': 3, 'name': 'Tanvir Ahmed', 'views': '85.0K', 'prize': '🥉 2,000 FZ Coins + Bronze Frame'},
      {'rank': 4, 'name': 'Rahim Uddin', 'views': '65.4K', 'prize': '🎁 1,000 FZ Coins'},
      {'rank': 5, 'name': 'Nusrat Jahan', 'views': '54.1K', 'prize': '🎁 1,000 FZ Coins'},
      {'rank': 6, 'name': 'Imran Khan', 'views': '48.9K', 'prize': '🎁 500 FZ Coins'},
      {'rank': 7, 'name': 'Sabbir Hossain', 'views': '42.3K', 'prize': '🎁 500 FZ Coins'},
      {'rank': 8, 'name': 'Anika Tabassum', 'views': '38.0K', 'prize': '🎁 500 FZ Coins'},
      {'rank': 9, 'name': 'Rakibul Islam', 'views': '31.5K', 'prize': '🎁 500 FZ Coins'},
      {'rank': 10, 'name': 'Mehedi Hasan', 'views': '29.0K', 'prize': '🎁 500 FZ Coins'},
    ];
  }
}
