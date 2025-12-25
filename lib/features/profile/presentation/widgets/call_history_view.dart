import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/text_styles.dart';

/// Pixel-perfect recreation of the Call History screen UI
/// 
/// Image Analysis Details:
/// - Header: Back arrow (left), "Call History" title (centered)
/// - Call entries: Circular icon, name "Kaitlyn Henson", "Outgoing Call", date "22/08/20"
class CallHistoryView extends StatelessWidget {
  const CallHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenWidth = size.width;
    final screenHeight = size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.05,
                vertical: screenHeight * 0.02,
              ),
              child: Row(
                children: [
                  // Back button
                  IconButton(
                    icon: const Icon(
                      Icons.chevron_left,
                      color: Color(0xFF333333),
                      size: 28,
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  // Title
                  Expanded(
                    child: Center(
                      child: Text(
                        'Call History',
                        style: AppTextStyles.robotoBold(
                          fontSize: 20,
                          color: const Color(0xFF333333),
                        ),
                      ),
                    ),
                  ),
                  // Placeholder for spacing
                  const SizedBox(width: 28),
                ],
              ),
            ),
            // Content
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                itemCount: 2, // Two identical entries as shown in image
                itemBuilder: (context, index) {
                  // Use n1.png and n2.png for avatars
                  final imagePaths = [
                    'assets/images/n1.png',
                    'assets/images/n2.png',
                  ];
                  return _CallEntry(
                    name: 'Kaitlyn Henson',
                    callType: 'Outgoing Call',
                    date: '22/08/20',
                    profileImagePath: imagePaths[index % imagePaths.length],
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

/// Call entry item
class _CallEntry extends StatelessWidget {
  final String name;
  final String callType;
  final String date;
  final String profileImagePath;

  const _CallEntry({
    required this.name,
    required this.callType,
    required this.date,
    required this.profileImagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          // Circular avatar using n1.png or n2.png
          Container(
            width: 56,
            height: 56,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: ClipOval(
              child: Image.asset(
                profileImagePath,
                width: 56,
                height: 56,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: const Color(0xFFE0E0E0),
                    child: const Icon(
                      Icons.person,
                      color: Color(0xFF9E9E9E),
                      size: 28,
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(width: 12),
          // Name and call type
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: AppTextStyles.robotoBold(
                    fontSize: 16,
                    color: const Color(0xFF333333),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  callType,
                  style: AppTextStyles.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF858585),
                  ),
                ),
              ],
            ),
          ),
          // Date
          Text(
            date,
            style: AppTextStyles.inter(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF858585),
            ),
          ),
        ],
      ),
    );
  }
}

