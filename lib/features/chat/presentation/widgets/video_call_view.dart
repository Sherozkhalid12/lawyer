import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/text_styles.dart';

/// Pixel-perfect recreation of the Video Call screen UI
/// 
/// Image Analysis Details:
/// - Background: Blurred image of the person (using profile image)
/// - Profile picture: 120px diameter, centered at ~35% from top
/// - Name: "Ad.Janson", 26px, white (#FFFFFF), semi-bold (w600)
/// - Call duration badge: "19 : 00 Minute", 18px, dark gray (#333333), light gray background (#E0E0E0)
/// - Red dot: 8-10px diameter, #FF0000, inside badge
/// - Bottom buttons: 3 circular buttons, 60-64px diameter, 60-64px spacing
///   - Speaker: Dark blue icon (#4242F0), light gray background (#E0E0E0)
///   - End call: White icon (#FFFFFF), red background (#E53935)
///   - Microphone: Dark blue icon (#4242F0), light gray background (#E0E0E0)
class VideoCallView extends StatelessWidget {
  final String profileImagePath;
  final String name;

  const VideoCallView({
    super.key,
    required this.profileImagePath,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Blurred background image
          _BlurredBackground(imagePath: profileImagePath),
          // Content overlay
          SafeArea(
            child: Column(
              children: [
                const Spacer(flex: 35), // ~35% from top
                // Circular profile picture
                _ProfilePicture(imagePath: profileImagePath),
                const SizedBox(height: 14), // 12-16px spacing
                // Name
                Text(
                  name,
                  style: AppTextStyles.inter(
                    fontSize: 26, // Font size: ~26 pixels
                    fontWeight: FontWeight.w600, // Semi-bold
                    color: const Color(0xFFFFFFFF), // White (#FFFFFF)
                  ),
                ),
                const SizedBox(height: 12), // 10-14px spacing
                // Call duration badge
                _CallDurationBadge(),
                const Spacer(flex: 65), // Push buttons to bottom
                // Bottom action buttons
                _ActionButtons(),
                SizedBox(height: MediaQuery.of(context).padding.bottom + 60), // 60-70px bottom margin
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Blurred background image
class _BlurredBackground extends StatelessWidget {
  final String imagePath;

  const _BlurredBackground({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          color: Colors.black.withOpacity(0.3), // Slight darkening overlay
        ),
      ),
    );
  }
}

/// Circular profile picture: 120px diameter, centered
class _ProfilePicture extends StatelessWidget {
  final String imagePath;

  const _ProfilePicture({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120, // Diameter: ~120 pixels
      height: 120,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: ClipOval(
        child: Image.asset(
          imagePath,
          width: 120,
          height: 120,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: const Color(0xFFE0E0E0),
              child: const Icon(
                Icons.person,
                color: Color(0xFF9E9E9E),
                size: 60,
              ),
            );
          },
        ),
      ),
    );
  }
}

/// Call duration badge: "19 : 00 Minute" with red dot
class _CallDurationBadge extends StatelessWidget {
  const _CallDurationBadge();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8), // 10-12px horizontal, 6-8px vertical
      decoration: BoxDecoration(
        color: const Color(0xFFE0E0E0), // Light gray background (#E0E0E0)
        borderRadius: BorderRadius.circular(20), // Rounded capsule shape
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Red dot
          Container(
            width: 9, // Diameter: ~8-10 pixels
            height: 9,
            decoration: const BoxDecoration(
              color: Color(0xFFFF0000), // Red (#FF0000)
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 8),
          // Duration text
          Text(
            '19 : 00 Minute',
            style: AppTextStyles.inter(
              fontSize: 18, // Font size: ~18 pixels
              fontWeight: FontWeight.w400, // Regular
              color: const Color(0xFF333333), // Dark gray (#333333)
            ),
          ),
        ],
      ),
    );
  }
}

/// Bottom action buttons: speaker, end call, microphone
class _ActionButtons extends StatelessWidget {
  const _ActionButtons();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Speaker button
        _ActionButton(
          icon: Icons.volume_up,
          iconColor: const Color(0xFF4242F0), // Dark blue (#4242F0)
          backgroundColor: const Color(0xFFE0E0E0), // Light gray (#E0E0E0)
          onTap: () {
            // TODO: Handle speaker toggle
          },
        ),
        const SizedBox(width: 62), // 60-64px spacing between buttons
        // End call button
        _ActionButton(
          icon: Icons.call_end,
          iconColor: const Color(0xFFFFFFFF), // White (#FFFFFF)
          backgroundColor: const Color(0xFFE53935), // Red (#E53935)
          onTap: () {
            Navigator.of(context).pop(); // End call and go back
          },
        ),
        const SizedBox(width: 62), // 60-64px spacing between buttons
        // Microphone button
        _ActionButton(
          icon: Icons.mic,
          iconColor: const Color(0xFF4242F0), // Dark blue (#4242F0)
          backgroundColor: const Color(0xFFE0E0E0), // Light gray (#E0E0E0)
          onTap: () {
            // TODO: Handle microphone toggle
          },
        ),
      ],
    );
  }
}

/// Individual action button: 60-64px diameter, circular
class _ActionButton extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color backgroundColor;
  final VoidCallback onTap;

  const _ActionButton({
    required this.icon,
    required this.iconColor,
    required this.backgroundColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 62, // Diameter: ~60-64 pixels
        height: 62,
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: iconColor,
          size: 28, // Icon size
        ),
      ),
    );
  }
}

