import 'package:flutter/material.dart';
import 'coin_referral_manager.dart';

class DailyRewardManager {
  static bool hasClaimedToday = false;

  static void claimDailyBonus(BuildContext context) {
    if (!hasClaimedToday) {
      CoinReferralManager.userCoins += 20; // প্রতিদিনের জন্য ২০ ফ্রি কয়েন
      hasClaimedToday = true;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('🎁 Daily Check-in Successful! You earned +20 Free Coins.'),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('⏰ You have already claimed your daily bonus today. Come back tomorrow!'),
          backgroundColor: Colors.orange,
        ),
      );
    }
  }
}
