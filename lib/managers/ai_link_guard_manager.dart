import 'package:flutter/material.dart';

class AiLinkGuardManager {
  // ১. ক্ষতিকর বা থার্ড-পার্টি লিংক ডিটেক্ট করার এআই লজিক
  static bool containsDangerousOrThirdPartyLink(String text) {
    // যেকোনো URL বা ওয়েবসাইটের প্যাটার্ন ধরার রেগুলার এক্সপ্রেশন
    final urlRegExp = RegExp(
      r'((https?:\/\/)?(www\.)?[a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*))',
      caseSensitive: false,
    );

    // টেক্সটে কোনো লিংক আছে কি না চেক করা
    if (urlRegExp.hasMatch(text)) {
      // এখানে আমরা অনুমোদিত বা নিরাপদ ডোমেইন বা প্ল্যাটফর্মের লিস্ট চেক করতে পারি (যেমন ফেইসবুক, ইউটিউব বা নিজস্ব অ্যাপের লিংক হলে পাস করবে)
      // যদি অন্য কোনো থার্ড-পার্টি বা ক্ষতিকর ফিশিং লিংক হয়, তবে এআই সেটিকে ব্লক করবে।
      
      // উদাহরণস্বরূপ: ব্যবহারকারী যদি নিজস্ব বা বিশ্বস্ত ডোমেইন ছাড়া অন্য কোনো এক্সটার্নাল লিংক দেয়:
      if (!text.contains('friendszone.com') && !text.contains('youtube.com')) {
        return true; // ক্ষতিকর বা আনসেফ থার্ড-পার্টি লিংক হিসেবে চিহ্নিত হলো
      }
    }
    return false;
  }

  // ২. লিংক ডিটেক্ট হলে মেসেজ ফিল্টার বা ডিলিট করে ওয়ার্নিং দেখানোর ফাংশন
  static String processAndValidateContent(BuildContext context, String inputContent) {
    if (containsDangerousOrThirdPartyLink(inputContent)) {
      // এআই সিকিউরিটি অ্যালার্ট পপআপ বা স্নাকবার দেখানো
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('🛡️ AI Link Guard: Third-party or harmful link detected and blocked automatically!'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3),
        ),
      );
      
      // ক্ষতিকর লিংকযুক্ত টেক্সট বা কমেন্ট রিমুভ/ফিল্টার করে নিরাপদ টেক্সট রিটার্ন করা
      return '[Message blocked by AI Security: Unauthorized Link]';
    }
    
    // লিংক নিরাপদ হলে বা লিংক না থাকলে মূল টেক্সট অপরিবর্তিত থাকবে
    return inputContent;
  }
}
