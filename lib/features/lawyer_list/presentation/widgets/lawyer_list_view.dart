import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/text_styles.dart';
import 'package:flutter_application_1/features/appointment/presentation/pages/appointment_page.dart';

class LawyerListView extends StatelessWidget {
  final String title;

  const LawyerListView({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenWidth = size.width;
    final screenHeight = size.height;

    return SafeArea(
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
                      title,
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
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.05,
              vertical: screenHeight * 0.015,
            ),
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
                  SizedBox(
                    width: 27,
                    height: 27,
                    child: const Icon(
                      Icons.search,
                      color: Color(0xFF858585),
                      size: 27,
                    ),
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
          // Lawyer cards list
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.05,
                vertical: screenHeight * 0.02,
              ),
              itemCount: 10, // Number of lawyer cards
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: screenHeight * 0.02),
                  child: _LawyerCard(
                    name: 'AD.Saif',
                    specialization: 'High Court lawyer',
                    rating: '5.0',
                    isFavorite: false,
                    pageTitle: title,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _LawyerCard extends StatelessWidget {
  final String name;
  final String specialization;
  final String rating;
  final bool isFavorite;
  final String pageTitle;

  const _LawyerCard({
    required this.name,
    required this.specialization,
    required this.rating,
    this.isFavorite = false,
    required this.pageTitle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const AppointmentPage()),
        );
      },
      child: Container(
        width: 361,
        height: 185,
        decoration: BoxDecoration(
          color: const Color(0xFFD2EBE7).withOpacity(0.3),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 16, right: 16, bottom: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Profile picture - full height on left
              Container(
                width: 132,
                height: 175,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                ),
                clipBehavior: Clip.none,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                      child: Image.asset(
                        'assets/images/boy.png',
                        width: 132,
                        height: 175,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: const Color(0xFFF5F5F5),
                            child: const Icon(
                              Icons.person,
                              color: Color(0xFF9E9E9E),
                              size: 40,
                            ),
                          );
                        },
                      ),
                    ),
                    // Online status indicator - green circle on top right edge (hide for Satisfied Client)
                    if (pageTitle != 'Satisfied Client')
                      Positioned(
                        top: -4,
                        right: -4,
                        child: Container(
                          width: 27,
                          height: 27,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              // Lawyer information
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Name and favorite icon
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            name,
                            style: AppTextStyles.robotoBold(
                              fontSize: 20,
                              color: const Color(0xFF333333),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // TODO: Toggle favorite
                          },
                          child: Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_border,
                            color: const Color(0xFFD9A22A),
                            size: 24,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    // Specialization
                    Text(
                      specialization,
                      style: AppTextStyles.inter(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF333333),
                      ),
                    ),
                    const SizedBox(height: 12),
                    // Divorce tags
                    Row(
                      children: [
                        _DivorceTag(),
                        const SizedBox(width: 8),
                        _DivorceTag(),
                      ],
                    ),
                    const Spacer(),
                    // Book button and rating
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Book button
                        SizedBox(
                          width: 75,
                          height: 28,
                          child: ElevatedButton(
                            onPressed: () {
                              // TODO: Handle book action
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF333333),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                              elevation: 0,
                              padding: EdgeInsets.zero,
                            ),
                            child: Text(
                              'Book',
                              style: AppTextStyles.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        // Rating
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.star,
                              color: Color(0xFFD9A22A),
                              size: 20,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              rating,
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
        ),
      ),
    );
  }
}

class _DivorceTag extends StatelessWidget {
  const _DivorceTag();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 23,
      width: 84,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFD9A22A), width: 1.5),
      ),
      child: Center(
        child: Text(
          'Divorce',
          style: AppTextStyles.inter(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF333333),
          ),
        ),
      ),
    );
  }
}
