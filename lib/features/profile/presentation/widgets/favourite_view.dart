import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/text_styles.dart';

/// Pixel-perfect recreation of the Favourite screen UI
/// 
/// Image Analysis Details:
/// - Header: Back arrow (left), "Favourite" title (centered)
/// - Search bar: Magnifying glass icon, "Search a Lawyer" placeholder
/// - Favourite card: Light green background, profile picture, name, description, Book button, rating, heart icon
class FavouriteView extends StatelessWidget {
  const FavouriteView({super.key});

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
                        'Favourite',
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
            // Search bar
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: const Color(0x4DD9D9D9),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFE0E0E0), width: 1.5),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 16),
                    const Icon(
                      Icons.search,
                      color: Color(0xFF858585),
                      size: 24,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search a Lawyer',
                          hintStyle: AppTextStyles.inter(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF858585),
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.zero,
                        ),
                        style: AppTextStyles.inter(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF858585),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Content
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                itemCount: 1, // One card as shown in image
                itemBuilder: (context, index) {
                  return _FavouriteCard();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Favourite lawyer card
class _FavouriteCard extends StatelessWidget {
  const _FavouriteCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0x4DD2EBE7), // Light green background with transparency (#D2EBE74D)
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile picture
              Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/boy.png',
                    width: 100,
                    height: 100,
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
              const SizedBox(width: 12),
              // Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'AD.Saif',
                      style: AppTextStyles.robotoBold(
                        fontSize: 18,
                        color: const Color(0xFF333333),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Jorem ipsum dolor, consectetur adipiscing elit. Nunc v libero et velit interdum, ac mattis.',
                      style: AppTextStyles.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF858585),
                        height: 1.4,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Book button
                        SizedBox(
                          width: 80,
                          height: 32,
                          child: ElevatedButton(
                            onPressed: () {
                              // TODO: Handle book
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF333333),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              elevation: 0,
                              padding: EdgeInsets.zero,
                            ),
                            child: Text(
                              'Book',
                              style: AppTextStyles.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        // Rating
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Color(0xFFD9A22A),
                              size: 20,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '5.0',
                              style: AppTextStyles.inter(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFF333333),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          // Heart icon in top right
          Positioned(
            top: 0,
            right: 0,
            child: Icon(
              Icons.favorite,
              color: const Color(0xFFD9A22A), // Yellow heart
              size: 24,
            ),
          ),
        ],
      ),
    );
  }
}

