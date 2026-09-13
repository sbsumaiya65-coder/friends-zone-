import 'package:flutter/material.dart';

class CoinReferralManager {
  static int userCoins = 150; // ডিফল্ট কয়েন ব্যালেন্স

  // কয়েন অর্নিং ফাংশন
  static void earnCoins(String actionType, BuildContext context) {
    int earned = 0;
    if (actionType == 'like') {
      earned = 1; // ১টি লাইকের জন্য ১ কয়েন
    } else if (actionType == 'comment') {
      earned = 2; // ১টি কমেন্টের জন্য ২ কয়েন
    } else if (actionType == 'share') {
      earned = 5; // ৫টি শেয়ারের জন্য ৫ কয়েন
    } else if (actionType == 'refer') {
      earned = 50; // রেফার করলে ৫০ কয়েন
    }

    userCoins += earned;
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Congratulations! Earned +$earned Coins. Total: $userCoins Coins'),
        backgroundColor: Colors.green,
      ),
    );
  }

  // প্রিমিয়াম আইটেম পারচেজ ফাংশন
  static bool spendCoins(int cost, BuildContext context) {
    if (userCoins >= cost) {
      userCoins -= cost;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Successfully Purchased Premium Item! Enjoy your feature.'),
          backgroundColor: Colors.purple,
        ),
      );
      return true;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Not enough coins! Earn more by referrals, likes, and shares.'),
          backgroundColor: Colors.red,
        ),
      );
      return false;
    }
  }
}
