import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/find_lawyer/presentation/pages/find_lawyer_page.dart';
import 'package:flutter_application_1/features/lawyer_list/presentation/pages/lawyer_list_page.dart';
import 'package:flutter_application_1/features/notifications/presentation/pages/notification_page.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenWidth = size.width;
    final screenHeight = size.height;

    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.02),
              // Header with profile and notification
              Row(
                children: [
                  // Profile picture
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color(0xFFE0E0E0),
                        width: 2,
                      ),
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/profile_picture.png',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: const Color(0xFFF5F5F5),
                            child: const Icon(
                              Icons.person,
                              color: Color(0xFF9E9E9E),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.03),
                  // Welcome text
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            const Text(
                              'Welcome',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF9E9E9E),
                              ),
                            ),
                            const SizedBox(width: 6),
                            const Text(
                              '👋',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 2),
                        const Text(
                          'Raja Saif',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF333333),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Notification icon
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const NotificationPage(),
                        ),
                      );
                    },
                    child: Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: const Color(0xFF333333),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.notifications_outlined,
                        color: Color(0xFFD9A22A),
                        size: 24,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.035),
              // Main heading
              const Text(
                'Explore and find your Best Lawyer',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF333333),
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              // Search bar
              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: const Color(0xFFE0E0E0),
                    width: 1.5,
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                        child: TextField(
                          decoration: const InputDecoration(
                            hintText: 'Search places',
                            hintStyle: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF9E9E9E),
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.zero,
                            isDense: true,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 1,
                      height: 25,
                      color: const Color(0xFFE0E0E0),
                    ),
                    const SizedBox(width: 12),
                    SizedBox(
                      width: 27,
                      height: 27,
                      child: const Icon(
                        Icons.search,
                        color: Color(0xFFD9A22A),
                        size: 27,
                      ),
                    ),
                    const SizedBox(width: 16),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.04),
              // Find by specialties section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Find by specialties',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF333333),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // TODO: Navigate to view all specialties
                    },
                    child: const Text(
                      'View all',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFFD9A22A),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.025),
              // Specialty cards grid
              Row(
                children: [
                  Expanded(
                    child: _SpecialtyCard(
                      imageAsset: 'assets/images/card1.png',
                      count: '100+',
                      title: 'LAWYER ON BOARD',
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const LawyerListPage(
                              title: 'Lawyer on Board',
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.025),
                  Expanded(
                    child: _SpecialtyCard(
                      imageAsset: 'assets/images/card2.png',
                      count: '100+',
                      title: 'SPECIAIIST LAWYER',
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const LawyerListPage(
                              title: 'Specialist Lawyer',
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.015),
              Row(
                children: [
                  Expanded(
                    child: _SpecialtyCard(
                      imageAsset: 'assets/images/card3.png',
                      count: '100+',
                      title: 'SATASFIED CLIENT',
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const LawyerListPage(
                              title: 'Satisfied Client',
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.025),
                  Expanded(
                    child: _SpecialtyCard(
                      imageAsset: 'assets/images/card4.png',
                      count: '100+',
                      title: 'ONLINE LAWYER',
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const LawyerListPage(
                              title: 'Online Lawyer',
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.04),
              // Find a lawyer button
              Center(
                child: SizedBox(
                  width: 360,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const FindLawyerPage(),
                        ),
                      );
                    },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF333333),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Find a lawyer',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
            ],
          ),
        ),
      ),
    );
  }
}

class _SpecialtyCard extends StatelessWidget {
  final String imageAsset;
  final String count;
  final String title;
  final VoidCallback? onTap;

  const _SpecialtyCard({
    required this.imageAsset,
    required this.count,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 110,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFFE4E2E2),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  imageAsset,
                  width: 40,
                  height: 40,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 40,
                      height: 40,
                      color: Colors.grey,
                    );
                  },
                ),
                Text(
                  count,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFFD9A22A),
                  ),
                ),
              ],
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: Color(0xFFD9A22A),
                letterSpacing: 0.5,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

