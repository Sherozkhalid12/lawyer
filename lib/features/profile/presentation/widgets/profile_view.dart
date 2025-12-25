import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/text_styles.dart';
import 'package:flutter_application_1/features/profile/presentation/widgets/edit_profile_view.dart';
import 'package:flutter_application_1/features/profile/presentation/widgets/help_faq_view.dart';
import 'package:flutter_application_1/features/profile/presentation/widgets/lawyer_notes_view.dart';
import 'package:flutter_application_1/features/profile/presentation/widgets/call_history_view.dart';
import 'package:flutter_application_1/features/profile/presentation/widgets/privacy_policy_view.dart';
import 'package:flutter_application_1/features/profile/presentation/widgets/appointments_view.dart';
import 'package:flutter_application_1/features/profile/presentation/widgets/favourite_view.dart';

/// Pixel-perfect recreation of the Profile screen UI
/// 
/// Image Analysis Details:
/// - Header: Back arrow (left), "Profile" title (centered)
/// - Profile picture: Circular, prominent display
/// - Name: "John Doe William", large bold font
/// - Phone: "+12345678909"
/// - Edit button: Dark yellow/gold background, white text, rounded corners
/// - Menu list: Icons on left, text, right arrow on right
class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

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
            // Header (no back button since it's part of main navigation)
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.05,
                vertical: screenHeight * 0.02,
              ),
              child: Center(
                child: Text(
                  'Profile',
                  style: AppTextStyles.robotoBold(
                    fontSize: 20,
                    color: const Color(0xFF333333),
                  ),
                ),
              ),
            ),
            // Content
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: Column(
                  children: [
                    SizedBox(height: screenHeight * 0.03),
                    // Profile picture
                    Container(
                      width: 120,
                      height: 120,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          'assets/images/boy.png',
                          width: 120,
                          height: 120,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: const Color(0xFFF5F5F5),
                              child: const Icon(
                                Icons.person,
                                color: Color(0xFF9E9E9E),
                                size: 60,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Name
                    Text(
                      'John Doe William',
                      style: AppTextStyles.robotoBold(
                        fontSize: 24,
                        color: const Color(0xFF333333),
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Phone number
                    Text(
                      '+12345678909',
                      style: AppTextStyles.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF858585),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Edit button - dark background, gold text, 55w x 26h
                    SizedBox(
                      width: 55,
                      height: 26,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const EditProfileView(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF333333), // Dark charcoal gray/black
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8), // Pill-like shape
                          ),
                          elevation: 0,
                          padding: EdgeInsets.zero, // Remove default padding
                        ),
                        child: Text(
                          'Edit',
                          style: AppTextStyles.inter(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFFD9A22A), // Golden-yellow text
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.04),
                    // Menu list
                    _MenuItem(
                      icon: Icons.access_time,
                      title: 'History',
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const CallHistoryView(),
                          ),
                        );
                      },
                    ),
                    _MenuItem(
                      icon: Icons.calendar_today,
                      title: 'Appointments',
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const AppointmentsView(),
                          ),
                        );
                      },
                    ),
                    _MenuItem(
                      icon: Icons.note,
                      title: 'Lawyer Note',
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const LawyerNotesView(),
                          ),
                        );
                      },
                    ),
                    _MenuItem(
                      icon: Icons.verified_user,
                      title: 'Term of use',
                      onTap: () {
                        // TODO: Navigate to terms of use
                      },
                    ),
                    _MenuItem(
                      icon: Icons.lock,
                      title: 'Privacy Policy',
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const PrivacyPolicyView(),
                          ),
                        );
                      },
                    ),
                    _MenuItem(
                      icon: Icons.help_outline,
                      title: 'Help&FAQ',
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const HelpFaqView(),
                          ),
                        );
                      },
                    ),
                    _MenuItem(
                      icon: Icons.favorite,
                      title: 'Favourite',
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const FavouriteView(),
                          ),
                        );
                      },
                    ),
                    _MenuItem(
                      icon: Icons.logout,
                      title: 'Logout',
                      onTap: () {
                        // TODO: Handle logout
                      },
                    ),
                    _MenuItem(
                      icon: Icons.delete_outline,
                      title: 'Delete Account',
                      onTap: () {
                        // TODO: Handle delete account
                      },
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

/// Menu list item with icon, text, and right arrow
class _MenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _MenuItem({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          children: [
            // Icon
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: const Color(0xFFD2EBE7), // Light teal/green background
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: const Color(0xFFD9A22A), // Gold icon color
                size: 20,
              ),
            ),
            const SizedBox(width: 16),
            // Title
            Expanded(
              child: Text(
                title,
                style: AppTextStyles.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF333333),
                ),
              ),
            ),
            // Right arrow
            const Icon(
              Icons.chevron_right,
              color: Color(0xFF858585),
              size: 24,
            ),
          ],
        ),
      ),
    );
  }
}

