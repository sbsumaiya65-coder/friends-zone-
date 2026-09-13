import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class SoundEffectManager {
  static final AudioPlayer _audioPlayer = AudioPlayer();

  // ১. প্রিমিয়াম ফিচার পারচেজ সাকসেস সাউন্ড
  static void playPurchaseSound() async {
    try {
      await _audioPlayer.play(AssetSource('sounds/purchase_success.mp3'));
    } catch (e) {
      debugPrint('Sound play error: $e');
    }
  }

  // ২. লাইক, কমেন্ট বা শেয়ার করার পপ/ক্লিক সাউন্ড
  static void playInteractionSound(String type) async {
    try {
      if (type == 'like') {
        await _audioPlayer.play(AssetSource('sounds/like_pop.mp3'));
      } else if (type == 'comment') {
        await _audioPlayer.play(AssetSource('sounds/comment_beep.mp3'));
      } else if (type == 'share') {
        await _audioPlayer.play(AssetSource('sounds/share_whoosh.mp3'));
      }
    } catch (e) {
      debugPrint('Sound play error: $e');
    }
  }

  // ৩. ভিআইপি গ্রুপ এন্ট্রি স্পেশাল সাউন্ড ও গ্র্যান্ড ইফেক্ট
  static void playVipEntrySound() async {
    try {
      await _audioPlayer.play(AssetSource('sounds/vip_grand_entry.mp3'));
    } catch (e) {
      debugPrint('Sound play error: $e');
    }
  }

  // স্ক্রিনে ভিআইপি এন্ট্রি পপআপ ডায়ালগ ও এনিমেশন দেখানোর ফাংশন
  static void showVipEntryEffect(BuildContext context, String userName) {
    playVipEntrySound(); // সাউন্ড বাজবে

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return TweenAnimationBuilder(
          tween: Tween<double>(begin: 0.5, end: 1.0),
          duration: const Duration(milliseconds: 600),
          curve: Curves.elasticOut,
          builder: (context, scale, child) {
            return Transform.scale(
              scale: scale,
              child: AlertDialog(
                backgroundColor: Colors.black87,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: const BorderSide(color: Colors.amber, width: 2),
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.workspace_premium, size: 70, color: Colors.amber),
                    const SizedBox(height: 12),
                    const Text(
                      '👑 VIP GRAND ENTRY 👑',
                      style: TextStyle(color: Colors.amber, fontSize: 18, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '$userName has entered the VIP Zone with style!',
                      style: const TextStyle(color: Colors.white70, fontSize: 13),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Awesome!', style: TextStyle(color: Colors.amber)),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

