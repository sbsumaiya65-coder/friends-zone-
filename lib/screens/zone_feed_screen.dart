import 'package:flutter/material.dart';

class ZoneFeedScreen extends StatelessWidget {
  const ZoneFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Zone Feed')),
      body: const Center(
        child: Text('Community Feed Posts'),
      ),
    );
  }
}

