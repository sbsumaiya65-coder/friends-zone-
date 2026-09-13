import 'package:audioplayers/audioplayers.dart';

class SoundHelper {
  static final AudioPlayer _audioPlayer = AudioPlayer();

  // লাইক, কমেন্ট বা শেয়ার করার সময় সাউন্ড প্লে করার ফাংশন
  static Future<void> playActionSound() async {
    try {
      // লোকাল অ্যাসেট ফোল্ডার থেকে সাউন্ড প্লে হবে (যেমন: assets/sounds/click.mp3)
      await _audioPlayer.play(AssetSource('sounds/click.mp3'));
    } catch (e) {
      // যদি অ্যাসেট ফাইল না থাকে তবে কোনো এরর হ্যান্ডেল করার জন্য
      print('Sound play error: $e');
    }
  }
}
