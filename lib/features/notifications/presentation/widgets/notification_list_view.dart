import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/text_styles.dart';

/// Pixel-perfect recreation of the notification list UI
/// 
/// Image Analysis Details:
/// - Layout: Vertical list of 5 notification items on white background
/// - Each item structure (left to right):
///   1. Circular profile picture (56x56) with thin light orange border (#FFB366, 1.5px)
///   2. Two-line text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit." (black, sans-serif, 15px)
///   3. Timestamp: "1m ago" (lighter grey #999999, smaller font 13px)
///   4. Red circular badge (20x20) with white "2" (red #FF0000, white text 12px, bold)
/// - Spacing: 12px between profile and text, 12px between text and badge
/// - Vertical padding: 12px per item
/// - Horizontal padding: 16px from screen edges
class NotificationListView extends StatelessWidget {
  const NotificationListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF), // Pure white background
      body: SafeArea(
        child: Column(
          children: [
            // Header with back arrow and "Notification" title
            _NotificationHeader(),
            // Notification list
            Expanded(
              child: ListView.builder(
                // Horizontal padding: 16px from screen edges
                // Vertical padding: 8px top/bottom for list spacing
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return _NotificationItem(
                    profileImageIndex: index,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Header component matching the image specifications:
/// - Header height: ~84 pixels
/// - Background: White (#FFFFFF)
/// - Back arrow: Left side, ~24px left margin, ~28px height, ~14px width, dark gray (#333333)
/// - "Notification" text: Centered, bold, ~28px font size, dark gray (#333333)
/// - Both elements vertically centered (~28px from top and bottom)
class _NotificationHeader extends StatelessWidget {
  const _NotificationHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 84, // Header height: ~84 pixels
      padding: const EdgeInsets.symmetric(horizontal: 0),
      alignment: Alignment.center,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Back arrow icon - left side with ~24px left margin
          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: IconButton(
              icon: const Icon(
                Icons.chevron_left,
                color: Color(0xFF333333), // Dark gray (#333333)
                size: 28, // Height: ~28 pixels
              ),
              onPressed: () => Navigator.of(context).pop(),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(
                minWidth: 14, // Width: ~14 pixels
                minHeight: 28, // Height: ~28 pixels
              ),
            ),
          ),
          // Title - centered using Expanded with Center
          Expanded(
            child: Center(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  'Notification',
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
          // Placeholder for spacing to balance the back arrow (24px padding + 14px icon = 38px)
          const SizedBox(width: 38),
        ],
      ),
    );
  }
}

class _NotificationItem extends StatelessWidget {
  final int profileImageIndex;

  const _NotificationItem({
    required this.profileImageIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // Vertical padding: 12px per item (top and bottom)
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Circular profile picture with light orange border
          _ProfilePicture(index: profileImageIndex),
          // Spacing: 12px between profile picture and text content
          const SizedBox(width: 12),
          // Text content and timestamp - takes remaining space
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Two-line Lorem ipsum text
                // Font: sans-serif (Inter), 15px, regular weight (400), black (#000000)
                // Line height: 1.4 for proper two-line spacing
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                  style: AppTextStyles.inter(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF000000), // Pure black text
                    height: 1.4, // Line height for two-line text
                    letterSpacing: 0,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                // Spacing: 4px between text and timestamp
                const SizedBox(height: 4),
                // Timestamp - smaller, lighter grey
                // Font: sans-serif (Inter), 13px, regular weight (400), lighter grey (#999999)
                Text(
                  '1m ago',
                  style: AppTextStyles.inter(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF999999), // Lighter grey for timestamp
                    height: 1.2,
                    letterSpacing: 0,
                  ),
                ),
              ],
            ),
          ),
          // Spacing: 12px between text content and badge
          const SizedBox(width: 12),
          // Red circular badge with white "2"
          _NotificationBadge(),
        ],
      ),
    );
  }
}

class _ProfilePicture extends StatelessWidget {
  final int index;

  const _ProfilePicture({required this.index});

  @override
  Widget build(BuildContext context) {
    // Profile picture: 56x56 pixels (standard notification avatar size)
    // Border: thin light orange (#FFB366), 1.5px width
    // Shape: perfect circle
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: const Color(0xFFFFB366), // Light orange border (thin)
          width: 1.5, // Thin border as described
        ),
      ),
      child: ClipOval(
        child: _getProfileImage(index),
      ),
    );
  }

  Widget _getProfileImage(int index) {
    // Using images n1.png, n2.png, n3.png for circular avatars
    // Cycling through the 3 images for the 5 notification items
    final imagePaths = [
      'assets/images/n1.png',
      'assets/images/n2.png',
      'assets/images/n3.png',
    ];

    return Image.asset(
      imagePaths[index % imagePaths.length],
      width: 56,
      height: 56,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        // Fallback to placeholder if image fails to load
        return Container(
          color: const Color(0xFFE0E0E0),
          child: Center(
            child: Icon(
              Icons.person,
              size: 32,
              color: Colors.white.withOpacity(0.8),
            ),
          ),
        );
      },
    );
  }
}

class _NotificationBadge extends StatelessWidget {
  const _NotificationBadge();

  @override
  Widget build(BuildContext context) {
    // Badge: 20x20 pixels (small circular badge)
    // Color: solid red (#FF0000)
    // Text: white "2", 12px, bold weight (600)
    // Position: horizontally aligned with text content, on far right
    return Container(
      width: 20,
      height: 20,
      decoration: const BoxDecoration(
        color: Color(0xFFFF0000), // Solid red badge
        shape: BoxShape.circle,
      ),
      child: const Center(
        child: Text(
          '2',
          style: TextStyle(
            color: Color(0xFFFFFFFF), // White text
            fontSize: 12,
            fontWeight: FontWeight.w600, // Bold weight
            height: 1.0, // Tight line height for single character
            letterSpacing: 0,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

