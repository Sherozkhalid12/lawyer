import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/text_styles.dart';

/// Pixel-perfect recreation of the Appointments screen UI
/// 
/// Image Analysis Details:
/// - Header: Back arrow (left), "Appalments" title (centered)
/// - Appointment cards: Light beige background, profile picture, name in yellow, details, phone icon
class AppointmentsView extends StatelessWidget {
  const AppointmentsView({super.key});

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
                        'Appalments',
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
                itemCount: 3, // Three identical cards as shown in image
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: _AppointmentCard(),
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

/// Appointment card
/// Image Analysis:
/// - Profile picture: Square with rounded corners (not circular), on the left
/// - Beige card: To the right of profile picture, contains all text details
/// - Name: "AD. Uroos Fatima" in golden-yellow (#D9A22A)
/// - "Divorce": Bold black text
/// - "High Sort Lawyer": Regular black text
/// - "Monday, 10:00 Am": Regular black text
/// - "Lawyer Location": Regular black/lighter gray text
/// - Phone icon: Black, positioned in bottom right of beige card
class _AppointmentCard extends StatelessWidget {
  const _AppointmentCard();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Profile picture - exact dimensions: 105px width, 126px height
        Container(
          width: 105,
          height: 126,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(23.57), // Rounded corners
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(23.57),
            child: Image.asset(
              'assets/images/boy.png',
              width: 105,
              height: 126,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: const Color(0xFFE0E0E0),
                  child: const Icon(
                    Icons.person,
                    color: Color(0xFF9E9E9E),
                    size: 50,
                  ),
                );
              },
            ),
          ),
        ),
        const SizedBox(width: 8), // Spacing between image and container (113px - 105px = 8px)
        // Beige card with appointment details - exact dimensions: 214px width, 126px height
        Container(
          width: 214,
          height: 126,
          decoration: BoxDecoration(
            color: const Color(0xFFFAF3ED), // Light beige background (#FAF3ED)
            borderRadius: BorderRadius.circular(23.57), // Border radius: 23.57px
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Content area with padding
              Padding(
                padding: const EdgeInsets.only(left: 12, top: 10, right: 40, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Name in golden-yellow
                    Text(
                      'AD. Uroos Fatima',
                      style: AppTextStyles.robotoBold(
                        fontSize: 16,
                        color: const Color(0xFFD9A22A), // Golden-yellow
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    // Divorce - bold black
                    Text(
                      'Divorce',
                      style: AppTextStyles.inter(
                        fontSize: 13,
                        fontWeight: FontWeight.w700, // Bold
                        color: const Color(0xFF333333), // Black
                      ),
                    ),
                    const SizedBox(height: 2),
                    // High Sort Lawyer - regular black
                    Text(
                      'High Sort Lawyer',
                      style: AppTextStyles.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w400, // Regular
                        color: const Color(0xFF333333), // Black
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),
                    // Monday, 10:00 Am - regular black
                    Text(
                      'Monday, 10:00 Am',
                      style: AppTextStyles.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w400, // Regular
                        color: const Color(0xFF333333), // Black
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),
                    // Lawyer Location - regular black/lighter gray
                    Text(
                      'Lawyer Location',
                      style: AppTextStyles.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w400, // Regular
                        color: const Color(0xFF333333), // Black
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              // Phone icon positioned in bottom right corner
              Positioned(
                right: 12,
                bottom: 12,
                child: const Icon(
                  Icons.phone,
                  color: Color(0xFF333333), // Black
                  size: 20,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

