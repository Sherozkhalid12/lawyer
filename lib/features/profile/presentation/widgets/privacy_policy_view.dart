import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/text_styles.dart';

/// Pixel-perfect recreation of the Privacy Policy screen UI
/// 
/// Image Analysis Details:
/// - Header: Back arrow (left), "Privacy Policy" title (centered)
/// - Sections: "Information we Collect", "How we use your Information", "Your Choice"
/// - Content: Lorem Ipsum placeholder text
class PrivacyPolicyView extends StatelessWidget {
  const PrivacyPolicyView({super.key});

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
                        'Privacy Policy',
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
                    // Information we Collect
                    _PolicySection(
                      title: 'Information we Collect',
                      content:
                          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    // How we use your Information
                    _PolicySection(
                      title: 'How we use your Information',
                      content:
                          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    // Your Choice
                    _PolicySection(
                      title: 'Your Choice',
                      content:
                          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
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

/// Policy section with title and content
class _PolicySection extends StatelessWidget {
  final String title;
  final String content;

  const _PolicySection({
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.robotoBold(
            fontSize: 18,
            color: const Color(0xFF333333),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          content,
          style: AppTextStyles.inter(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: const Color(0xFF858585),
            height: 1.5,
          ),
        ),
      ],
    );
  }
}

