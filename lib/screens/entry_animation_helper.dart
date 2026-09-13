import 'package:flutter/material.dart';

class EntryAnimationHelper {
  static void showEntryPopup(BuildContext context, String userName) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.pink.shade50,
          title: const Text('🚀 VIP Entry!', textAlign: TextAlign.center, style: TextStyle(color: Colors.pink)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.rocket_launch, size: 60, color: Colors.purple),
              const SizedBox(height: 12),
              Text(
                '$userName has entered the room with a luxury sports car animation!',
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Awesome', style: TextStyle(color: Colors.pink)),
            ),
          ],
        );
      },
    );
  }
}
