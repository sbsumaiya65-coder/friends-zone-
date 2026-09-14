import 'package:flutter/material.dart';
import '../managers/ai_link_guard_manager.dart'; // এআই লিংক গার্ড ম্যানেজার ইমপোর্ট

class CommentSectionScreen extends StatefulWidget {
  const CommentSectionScreen({super.key});

  @override
  State<CommentSectionScreen> createState() => _CommentSectionScreenState();
}

class _CommentSectionScreenState extends State<CommentSectionScreen> {
  final TextEditingController _commentController = TextEditingController();
  final List<String> _commentsList = []; // কমেন্ট জমা রাখার লিস্ট

  // 🤖 এআই লিংক গার্ড সহ কমেন্ট সাবমিট করার মূল ফাংশন
  void _submitComment(String rawCommentText) {
    if (rawCommentText.trim().isEmpty) return;

    // ১. এআই লিংক গার্ড দিয়ে টেক্সট চেক ও ক্ষতিকর থার্ড-পার্টি লিংক ফিল্টার করা
    String safeText = AiLinkGuardManager.processAndValidateContent(context, rawCommentText);

    // ২. যদি লিংক ব্লক হয়ে যায়, তবে কমেন্ট পোস্ট হওয়া আটকে যাবে
    if (safeText.contains('blocked by AI Security')) {
      _commentController.clear();
      return; 
    }

    // ৩. নিরাপদ থাকলে কমেন্ট লিস্টে বা ডাটাবেজে যোগ হবে
    setState(() {
      _commentsList.add(safeText);
      _commentController.clear(); // ইনপুট বক্স খালি করা
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('💬 FZ Secure Comments & AI Guard'),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // কমেন্ট লিস্ট ভিউ
          Expanded(
            child: _commentsList.isEmpty
                ? const Center(
                    child: Text(
                      'No comments yet. Be the first to comment!\n(Protected by AI Link Guard 🛡️)',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey),
                    ),
                  )
                : ListView.builder(
                    itemCount: _commentsList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        child: ListTile(
                          leading: const CircleAvatar(
                            backgroundColor: Colors.pink,
                            child: Icon(Icons.person, color: Colors.white),
                          ),
                          title: const Text('User', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                          subtitle: Text(_commentsList[index]),
                        ),
                      );
                    },
                  ),
          ),

          // কমেন্ট ইনপুট বক্স ও সেন্ড বাটন
          Container(
            padding: const EdgeInsets.all(8.0),
            color: Colors.grey.shade100,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _commentController,
                    decoration: InputDecoration(
                      hintText: 'Write a safe comment...',
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                CircleAvatar(
                  backgroundColor: Colors.pink,
                  child: IconButton(
                    icon: const Icon(Icons.send, color: Colors.white, size: 18),
                    onPressed: () => _submitComment(_commentController.text),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
