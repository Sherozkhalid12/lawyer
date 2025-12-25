import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/text_styles.dart';
import 'package:flutter_application_1/features/select_datetime/presentation/pages/select_datetime_page.dart';
import 'package:flutter_application_1/features/chat/presentation/pages/chat_detail_page.dart';
import 'package:flutter_application_1/features/chat/presentation/widgets/video_call_view.dart';

class AppointmentView extends StatefulWidget {
  const AppointmentView({super.key});

  @override
  State<AppointmentView> createState() => _AppointmentViewState();
}

class _AppointmentViewState extends State<AppointmentView> {
  String? selectedTimeSlot = '11.00 AM';
  String? selectedDate = 'Sun 4';

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
                    Icons.arrow_back,
                    color: Color(0xFF333333),
                    size: 24,
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                // Title
                Expanded(
                  child: Center(
                    child: Text(
                      'Appalment',
                      style: AppTextStyles.robotoBold(
                        fontSize: 20,
                        color: const Color(0xFF333333),
                      ),
                    ),
                  ),
                ),
                // Placeholder for spacing
                const SizedBox(width: 48),
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
                  // Lawyer Profile Section
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Profile picture - separate container
                        Container(
                          width: 132,
                          height: 132,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.red,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              'assets/images/boy.png',
                              width: 132,
                              height: 132,
                              fit: BoxFit.contain,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  width: 132,
                                  height: 132,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: const Color(0xFFF5F5F5),
                                  ),
                                  child: const Icon(
                                    Icons.person,
                                    color: Color(0xFF9E9E9E),
                                    size: 40,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        // Lawyer information
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Name and icons row
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // Name
                                        Text(
                                          'Dr. Upul',
                                          style: AppTextStyles.robotoBold(
                                            fontSize: 20,
                                            color: const Color(0xFF333333),
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        // Profession
                                        Text(
                                          'High Court LAwyer',
                                          style: AppTextStyles.inter(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0xFF858585),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  // Chat and Video icons
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      // Chat icon
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  ChatDetailPage(
                                                    chatName: 'Dr. Upul',
                                                    profileImagePath:
                                                        'assets/images/boy.png',
                                                  ),
                                            ),
                                          );
                                        },
                                        child: Container(
                                          width: 32,
                                          height: 32,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: const Color(0xFFD9A22A),
                                              width: 1.5,
                                            ),
                                          ),
                                          child: const Icon(
                                            Icons.chat_bubble_outline,
                                            color: Color(0xFFD9A22A),
                                            size: 16,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      // Video call icon
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  VideoCallView(
                                                    profileImagePath:
                                                        'assets/images/boy.png',
                                                    name: 'Dr. Upul',
                                                  ),
                                            ),
                                          );
                                        },
                                        child: Container(
                                          width: 32,
                                          height: 32,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: const Color(0xFFD9A22A),
                                              width: 1.5,
                                            ),
                                          ),
                                          child: const Icon(
                                            Icons.videocam_outlined,
                                            color: Color(0xFFD9A22A),
                                            size: 16,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              // Divorce tags
                              Row(
                                children: [
                                  _DivorceTag(),
                                  const SizedBox(width: 8),
                                  _DivorceTag(),
                                ],
                              ),
                              const SizedBox(height: 12),
                              // Payment
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Payment',
                                    style: AppTextStyles.robotoBold(
                                      fontSize: 15,
                                      color: const Color(0xFF333333),
                                    ),
                                  ),
                                  Text(
                                    '\$120.0',
                                    style: AppTextStyles.inter(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xFFD9A22A),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  // Details Section
                  Text(
                    'Details',
                    style: AppTextStyles.robotoBold(
                      fontSize: 20,
                      color: const Color(0xFF333333),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.015),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.',
                    style: AppTextStyles.inter(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF858585),
                      height: 1.5,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  // Working Hours Section
                  Text(
                    'Working Hours',
                    style: AppTextStyles.robotoBold(
                      fontSize: 20,
                      color: const Color(0xFF333333),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _TimeSlotButton(
                          label: '10.00 AM',
                          isSelected: selectedTimeSlot == '10.00 AM',
                          onTap: () =>
                              setState(() => selectedTimeSlot = '10.00 AM'),
                        ),
                        const SizedBox(width: 12),
                        _TimeSlotButton(
                          label: '11.00 AM',
                          isSelected: selectedTimeSlot == '11.00 AM',
                          onTap: () =>
                              setState(() => selectedTimeSlot = '11.00 AM'),
                        ),
                        const SizedBox(width: 12),
                        _TimeSlotButton(
                          label: '12.00',
                          isSelected: selectedTimeSlot == '12.00',
                          onTap: () =>
                              setState(() => selectedTimeSlot = '12.00'),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  // Date Section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Date',
                        style: AppTextStyles.robotoBold(
                          fontSize: 20,
                          color: const Color(0xFF333333),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // TODO: Show all dates
                        },
                        child: Text(
                          'See All',
                          style: AppTextStyles.inter(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFFD9A22A),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _DateButton(
                          label: 'Sun 4',
                          isSelected: selectedDate == 'Sun 4',
                          onTap: () => setState(() => selectedDate = 'Sun 4'),
                        ),
                        const SizedBox(width: 12),
                        _DateButton(
                          label: 'Mon 5',
                          isSelected: selectedDate == 'Mon 5',
                          onTap: () => setState(() => selectedDate = 'Mon 5'),
                        ),
                        const SizedBox(width: 12),
                        _DateButton(
                          label: 'Tue 6',
                          isSelected: selectedDate == 'Tue 6',
                          onTap: () => setState(() => selectedDate = 'Tue 6'),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.04),
                ],
              ),
            ),
          ),
          // Footer Button
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
            child: Center(
              child: SizedBox(
                width: 360,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const SelectDateTimePage(),
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
                  child: Text(
                    'Book Appalment',
                    style: AppTextStyles.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
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

class _TimeSlotButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _TimeSlotButton({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 129,
        height: 56,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFD9A22A) : const Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            label,
            style: AppTextStyles.inter(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: isSelected ? Colors.white : const Color(0xFF333333),
            ),
          ),
        ),
      ),
    );
  }
}

class _DateButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _DateButton({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 129,
        height: 56,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFD9A22A) : const Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            label,
            style: AppTextStyles.inter(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: isSelected ? Colors.white : const Color(0xFF333333),
            ),
          ),
        ),
      ),
    );
  }
}
