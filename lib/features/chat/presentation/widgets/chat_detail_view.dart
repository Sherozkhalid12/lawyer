import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/text_styles.dart';
import 'package:flutter_application_1/features/chat/presentation/widgets/video_call_view.dart';

/// Pixel-perfect recreation of the Chat Detail screen UI
/// 
/// Image Analysis Details:
/// - Header: 56px height, back arrow (24px left, 24x24px, #333333), "Chat" title (28px, bold, #333333, centered), phone icon (24px right, 24x24px, #333333)
/// - Date separators: 14-16px font, #333333, centered, ~40px spacing
/// - Sender bubbles: Right-aligned, light blue-green (#D1EDF2), 16-20px border radius, 16-18px text, #333333
/// - Receiver bubbles: Left-aligned, light gray (#E0E0E0), 16-20px border radius, 16-18px text, #333333
/// - Profile pictures: 48-50px diameter, circular
/// - Timestamps: 12-14px, #757575, below bubbles, right-aligned
/// - Spacing: 16-20px from screen edges, 12-16px between bubble and profile picture
class ChatDetailView extends StatelessWidget {
  final String chatName;
  final String profileImagePath;

  const ChatDetailView({
    super.key,
    required this.chatName,
    required this.profileImagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF), // Pure white background
      body: SafeArea(
        child: Column(
          children: [
            // Header with back arrow, "Chat" title, and phone icon
            _ChatDetailHeader(
              chatName: chatName,
              profileImagePath: profileImagePath,
            ),
            // Chat messages list
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                children: [
                  // Date separator: "Saturday, March 14, 2022"
                  _DateSeparator(text: 'Saturday, March 14, 2022'),
                  const SizedBox(height: 20), // ~20-24px spacing
                  // Sender message: "Tomorrow definitely"
                  _SenderMessage(
                    text: 'Tomorrow definitely',
                    timestamp: '10:30 PM',
                    profileImagePath: 'assets/images/n1.png', // Sender uses n1.png
                  ),
                  const SizedBox(height: 20), // ~20-24px spacing between different senders
                  // Receiver message: "Okie Dokie 🥰🥰"
                  _ReceiverMessage(
                    text: 'Okie Dokie 🥰🥰',
                    timestamp: '10:38 PM',
                    profileImagePath: 'assets/images/n3.png', // Receiver uses n3.png
                  ),
                  const SizedBox(height: 20), // ~20-24px spacing
                  // Sender message: "Done, my friend"
                  _SenderMessage(
                    text: 'Done, my friend',
                    timestamp: '07:00 PM',
                    profileImagePath: 'assets/images/n1.png',
                  ),
                  const SizedBox(height: 40), // ~40px spacing before date separator
                  // Date separator: "Today"
                  _DateSeparator(text: 'Today'),
                  const SizedBox(height: 20), // ~20-24px spacing
                  // Receiver message: "I will do the voice over"
                  _ReceiverMessage(
                    text: 'I will do the voice over',
                    timestamp: '10:30 PM',
                    profileImagePath: 'assets/images/n3.png', // Receiver uses n3.png
                  ),
                  const SizedBox(height: 20), // Bottom padding
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Header: 56px height, back arrow, "Chat" title (28px, bold), phone icon
class _ChatDetailHeader extends StatelessWidget {
  final String chatName;
  final String profileImagePath;

  const _ChatDetailHeader({
    required this.chatName,
    required this.profileImagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56, // Header height: ~56 pixels
      padding: const EdgeInsets.symmetric(horizontal: 0),
      alignment: Alignment.center,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Back arrow icon - left side with ~24px left margin
          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: IconButton(
              icon: const Icon(
                Icons.chevron_left,
                color: Color(0xFF333333), // Dark gray (#333333)
                size: 24, // Size: ~24x24 pixels
              ),
              onPressed: () => Navigator.of(context).pop(),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(
                minWidth: 24,
                minHeight: 24,
              ),
            ),
          ),
          // Title - centered
          Expanded(
            child: Center(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  'Chat',
                  style: AppTextStyles.robotoBold(
                    fontSize: 28, // Font size: ~28 pixels
                    color: const Color(0xFF333333), // Dark gray (#333333)
                    fontWeight: FontWeight.w700, // Bold
                  ),
                  maxLines: 1,
                ),
              ),
            ),
          ),
          // Phone icon - right side with ~24px right margin
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: IconButton(
              icon: const Icon(
                Icons.phone,
                color: Color(0xFF333333), // Dark gray (#333333)
                size: 24, // Size: ~24x24 pixels
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => VideoCallView(
                      profileImagePath: profileImagePath,
                      name: chatName,
                    ),
                  ),
                );
              },
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(
                minWidth: 24,
                minHeight: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Date separator: Centered text, 14-16px font, #333333
class _DateSeparator extends StatelessWidget {
  final String text;

  const _DateSeparator({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8), // ~40px total spacing
      child: Center(
        child: Text(
          text,
          style: AppTextStyles.inter(
            fontSize: 15, // Font size: ~14-16 pixels
            fontWeight: FontWeight.w400, // Regular weight
            color: const Color(0xFF333333), // Dark gray (#333333)
          ),
        ),
      ),
    );
  }
}

/// Sender message: Right-aligned, light blue-green bubble (#D1EDF2)
class _SenderMessage extends StatelessWidget {
  final String text;
  final String timestamp;
  final String profileImagePath;

  const _SenderMessage({
    required this.text,
    required this.timestamp,
    required this.profileImagePath,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        // Message bubble and timestamp column
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Chat bubble
            ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: screenWidth * 0.7,
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: const Color(0x80ADD8E6), // Light blue with alpha (#ADD8E680)
                  borderRadius: BorderRadius.circular(18), // Border radius: ~16-20 pixels
                ),
                child: Text(
                  text,
                  style: AppTextStyles.inter(
                    fontSize: 17, // Font size: ~16-18 pixels
                    fontWeight: FontWeight.w400, // Regular
                    color: const Color(0xFF333333), // Dark gray (#333333)
                  ),
                ),
              ),
            ),
            const SizedBox(height: 4), // Small spacing between bubble and timestamp
            // Timestamp - below and to the right of bubble
            Padding(
              padding: const EdgeInsets.only(right: 4),
              child: Text(
                timestamp,
                style: AppTextStyles.inter(
                  fontSize: 13, // Font size: ~12-14 pixels
                  fontWeight: FontWeight.w400, // Regular
                  color: const Color(0xFF757575), // Light gray (#757575)
                ),
              ),
            ),
          ],
        ),
        const SizedBox(width: 12), // 12-16px spacing between bubble and profile picture
        // Profile picture
        _ProfilePicture(imagePath: profileImagePath),
      ],
    );
  }
}

/// Receiver message: Left-aligned, light gray bubble (#E0E0E0)
class _ReceiverMessage extends StatelessWidget {
  final String text;
  final String timestamp;
  final String profileImagePath;

  const _ReceiverMessage({
    required this.text,
    required this.timestamp,
    required this.profileImagePath,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        // Profile picture
        _ProfilePicture(imagePath: profileImagePath),
        const SizedBox(width: 12), // 12-16px spacing between profile picture and bubble
        // Message bubble and timestamp column
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Chat bubble
            ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: screenWidth * 0.7,
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: const Color(0xFFE6E5EB), // Light gray (#E6E5EB)
                  borderRadius: BorderRadius.circular(18), // Border radius: ~16-20 pixels
                ),
                child: Text(
                  text,
                  style: AppTextStyles.inter(
                    fontSize: 17, // Font size: ~16-18 pixels
                    fontWeight: FontWeight.w400, // Regular
                    color: const Color(0xFF333333), // Dark gray (#333333)
                  ),
                ),
              ),
            ),
            const SizedBox(height: 4), // Small spacing between bubble and timestamp
            // Timestamp - below and to the right of bubble
            Padding(
              padding: const EdgeInsets.only(left: 4),
              child: Text(
                timestamp,
                style: AppTextStyles.inter(
                  fontSize: 13, // Font size: ~12-14 pixels
                  fontWeight: FontWeight.w400, // Regular
                  color: const Color(0xFF757575), // Light gray (#757575)
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

/// Profile picture: 48-50px diameter, circular
class _ProfilePicture extends StatelessWidget {
  final String imagePath;

  const _ProfilePicture({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50, // Diameter: ~48-50 pixels
      height: 50,
      child: ClipOval(
        child: Image.asset(
          imagePath,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: const Color(0xFFE0E0E0),
              child: const Icon(
                Icons.person,
                color: Color(0xFF9E9E9E),
                size: 30,
              ),
            );
          },
        ),
      ),
    );
  }
}

