// এই ফাংশনটি আপনার প্লাস (+) বাটনের onPressed-এ কল করতে হবে
void _showCreateBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return Container(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 30),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // বটম শীটের ওপরের ছোট বার (Drag handle)
            Center(
              child: Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            
            // "Create" টাইটেল
            const Text(
              'Create',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 20),

            // অপশনগুলোর গ্রিড বা রো লেআউট
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildCreateItem(context, Icons.grid_view_rounded, 'Post', () {
                  Navigator.pop(context);
                  // TODO: Post পেজে যাওয়ার কোড
                }),
                _buildCreateItem(context, Icons.add_circle, 'Zone Story', () {
                  Navigator.pop(context);
                  // TODO: Story পেজে যাওয়ার কোড
                }),
                _buildCreateItem(context, Icons.video_collection, 'Feels', () {
                  Navigator.pop(context);
                  // TODO: Feels/Reels পেজে যাওয়ার কোড
                }),
                _buildCreateItem(context, Icons.touch_app, 'Flick', () {
                  Navigator.pop(context);
                  // TODO: Flick পেজে যাওয়ার কোড
                }),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Row(
                    children: [
                      _buildCreateItem(context, Icons.live_tv, 'Go Live', () {
                        Navigator.pop(context);
                        // TODO: Live পেজে যাওয়ার কোড
                      }),
                      const SizedBox(width: 32),
                      _buildCreateItemWithBadge(context, Icons.mic, 'Audio Soon', true, () {
                        Navigator.pop(context);
                      }),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}

// গোল আইকন এবং লেআউট তৈরি করার হেল্পার উইজেট
Widget _buildCreateItem(BuildContext context, IconData icon, String label, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Column(
      children: [
        Container(
          height: 65,
          width: 65,
          decoration: BoxDecoration(
            color: Colors.pink.shade50,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.pink.shade100, width: 1),
          ),
          child: Icon(icon, color: Colors.pink, size: 28),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
      ],
    ),
  );
}

// "Audio Soon" ব্যাজসহ আইকন তৈরি করার হেল্পার উইজেট
Widget _buildCreateItemWithBadge(BuildContext context, IconData icon, String label, bool isSoon, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 65,
              width: 65,
              decoration: BoxDecoration(
                color: Colors.pink.shade50,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.pink.shade100, width: 1),
              ),
              child: Icon(icon, color: Colors.pink, size: 28),
            ),
            if (isSoon)
              Positioned(
                bottom: -4,
                right: -8,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    'SOON',
                    style: TextStyle(fontSize: 9, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
      ],
    ),
  );
}
