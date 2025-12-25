import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/text_styles.dart';

/// Pixel-perfect recreation of the Lawyer Notes screen UI
/// 
/// Image Analysis Details:
/// - Header: Back arrow (left), "Lawyer Notes" title (centered)
/// - Tags: Four "Divorce" tags, first dark grey, others light yellow
/// - Question: "Do you share our data with any 3rd parties" in bold
/// - Content: Placeholder text with "Read more" in yellow
class LawyerNotesView extends StatelessWidget {
  const LawyerNotesView({super.key});

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
                        'Lawyer Notes',
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
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: screenHeight * 0.02),
                    // Tags
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          _TagButton(
                            text: 'Divorce',
                            isSelected: true,
                            onTap: () {},
                          ),
                          const SizedBox(width: 8),
                          _TagButton(
                            text: 'Divorce',
                            isSelected: false,
                            onTap: () {},
                          ),
                          const SizedBox(width: 8),
                          _TagButton(
                            text: 'Divorce',
                            isSelected: false,
                            onTap: () {},
                          ),
                          const SizedBox(width: 8),
                          _TagButton(
                            text: 'Divorce',
                            isSelected: false,
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    // Question
                    Text(
                      'Do you share our data with any 3rd parties',
                      style: AppTextStyles.robotoBold(
                        fontSize: 18,
                        color: const Color(0xFF333333),
                      ),
                    ),
                    const SizedBox(height: 12),
                    // Content
                    Text(
                      'hb sdjbchjbhjbsdjh jhb hj hj hj jh hbhujbhb hb hjbhjbh jbhujb hbsdfdsv sdv sdvsd vsvdvvdvsb sdvsdvv.',
                      style: AppTextStyles.inter(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF858585),
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Read more
                    GestureDetector(
                      onTap: () {
                        // TODO: Expand content
                      },
                      child: Text(
                        'Read more',
                        style: AppTextStyles.inter(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFFD9A22A), // Yellow
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Tag button: Oval-shaped, dark grey when selected, light yellow when not
class _TagButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const _TagButton({
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xFF333333) // Dark grey when selected
              : const Color(0xFFD9A22A).withOpacity(0.2), // Light yellow when not
          borderRadius: BorderRadius.circular(20), // Oval shape
        ),
        child: Text(
          text,
          style: AppTextStyles.inter(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: isSelected
                ? Colors.white
                : const Color(0xFF333333), // Dark text on light yellow
          ),
        ),
      ),
    );
  }
}

