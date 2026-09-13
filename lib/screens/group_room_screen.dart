import 'package:flutter/material.dart';

class GroupRoomScreen extends StatelessWidget {
  const GroupRoomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Group Room')),
      body: const Center(
        child: Text('Group Voice & Video Rooms'),
      ),
    );
  }
}

