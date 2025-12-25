import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/text_styles.dart';

/// Pixel-perfect recreation of the Edit Profile screen UI
/// 
/// Image Analysis Details:
/// - Header: Back arrow (left), "Profile" title (centered)
/// - Profile picture: Circular, with "Change Profile Pic" button below
/// - Form fields: Full Name, Select Gender, Date of Birth, About
/// - Save Change button: Dark gray, white text, rounded corners, at bottom
class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _dateOfBirthController = TextEditingController();
  final TextEditingController _aboutController = TextEditingController();
  String? _selectedGender;

  @override
  void dispose() {
    _fullNameController.dispose();
    _dateOfBirthController.dispose();
    _aboutController.dispose();
    super.dispose();
  }

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
                        'Profile',
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
                    // Change Profile Pic button - 167px width (hug), 26px height, 15px radius, #28282B background
                    SizedBox(
                      width: 167, // Hug width: 167px
                      height: 26, // Hug height: 26px
                      child: ElevatedButton(
                        onPressed: () {
                          // TODO: Handle change profile picture
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF28282B), // Main color: #28282B
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15), // Radius: 15px
                          ),
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 13, // Left/Right: 13px
                            vertical: 5, // Top/Bottom: 5px
                          ),
                        ),
                        child: Text(
                          'Change Profile Pic',
                          style: AppTextStyles.inter(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.04),
                    // Full Name field
                    _FormField(
                      label: 'Full Name',
                      controller: _fullNameController,
                      placeholder: 'Please Pick Something',
                    ),
                    SizedBox(height: screenHeight * 0.025),
                    // Select Gender field
                    _GenderDropdown(
                      label: 'Select Gender',
                      selectedValue: _selectedGender,
                      placeholder: 'Please Pick Something',
                      onChanged: (value) {
                        setState(() {
                          _selectedGender = value;
                        });
                      },
                    ),
                    SizedBox(height: screenHeight * 0.025),
                    // Date of Birth field
                    _DateOfBirthField(
                      label: 'Date of Birth',
                      controller: _dateOfBirthController,
                      placeholder: 'Please Pick Something',
                    ),
                    SizedBox(height: screenHeight * 0.025),
                    // About field
                    _AboutField(
                      label: 'About',
                      controller: _aboutController,
                      placeholder: 'Right come thing about your self',
                    ),
                    SizedBox(height: screenHeight * 0.04),
                  ],
                ),
              ),
            ),
            // Save Change button
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.05,
                vertical: screenHeight * 0.02,
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(color: Color(0xFFE0E0E0), width: 1),
                ),
              ),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    // TODO: Handle save changes
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF333333), // Dark gray
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'Save Change',
                    style: AppTextStyles.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Form field with label and text input
class _FormField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String placeholder;

  const _FormField({
    required this.label,
    required this.controller,
    required this.placeholder,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.inter(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF333333),
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFFF0F2F4), // Background color for typing
            hintText: placeholder,
            hintStyle: AppTextStyles.inter(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF858585),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Color(0xFFE0E0E0),
                width: 1,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Color(0xFFE0E0E0),
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Color(0xFFD9A22A),
                width: 1.5,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          ),
          style: AppTextStyles.inter(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: const Color(0xFF333333),
          ),
        ),
      ],
    );
  }
}

/// Gender dropdown field
class _GenderDropdown extends StatelessWidget {
  final String label;
  final String? selectedValue;
  final String placeholder;
  final ValueChanged<String?> onChanged;

  const _GenderDropdown({
    required this.label,
    required this.selectedValue,
    required this.placeholder,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.inter(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF333333),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFFF0F2F4), // Background color for typing
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: const Color(0xFFE0E0E0),
              width: 1,
            ),
          ),
          child: DropdownButtonFormField<String>(
            value: selectedValue,
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xFFF0F2F4), // Background color for typing
              hintText: placeholder,
              hintStyle: AppTextStyles.inter(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF858585),
              ),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              suffixIcon: const Icon(
                Icons.arrow_drop_down,
                color: Color(0xFFD9A22A), // Gold color
              ),
            ),
            items: ['Male', 'Female', 'Other'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: AppTextStyles.inter(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF333333),
                  ),
                ),
              );
            }).toList(),
            onChanged: onChanged,
            style: AppTextStyles.inter(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF333333),
            ),
          ),
        ),
      ],
    );
  }
}

/// Date of Birth field with calendar icon
class _DateOfBirthField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String placeholder;

  const _DateOfBirthField({
    required this.label,
    required this.controller,
    required this.placeholder,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.inter(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF333333),
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          readOnly: true,
          onTap: () async {
            final DateTime? picked = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
            );
            if (picked != null) {
              controller.text = '${picked.day}/${picked.month}/${picked.year}';
            }
          },
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFFF0F2F4), // Background color for typing
            hintText: placeholder,
            hintStyle: AppTextStyles.inter(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF858585),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Color(0xFFE0E0E0),
                width: 1,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Color(0xFFE0E0E0),
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Color(0xFFD9A22A),
                width: 1.5,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            suffixIcon: const Icon(
              Icons.calendar_today,
              color: Color(0xFFD9A22A), // Gold color
              size: 20,
            ),
          ),
          style: AppTextStyles.inter(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: const Color(0xFF333333),
          ),
        ),
      ],
    );
  }
}

/// About field (multi-line text area)
class _AboutField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String placeholder;

  const _AboutField({
    required this.label,
    required this.controller,
    required this.placeholder,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.inter(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF333333),
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          maxLines: 5,
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFFF0F2F4), // Background color for typing
            hintText: placeholder,
            hintStyle: AppTextStyles.inter(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF858585),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Color(0xFFE0E0E0),
                width: 1,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Color(0xFFE0E0E0),
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Color(0xFFD9A22A),
                width: 1.5,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          ),
          style: AppTextStyles.inter(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: const Color(0xFF333333),
          ),
        ),
      ],
    );
  }
}

