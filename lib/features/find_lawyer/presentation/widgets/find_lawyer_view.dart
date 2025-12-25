import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/text_styles.dart';
import 'package:flutter_application_1/features/lawyer_list/presentation/pages/lawyer_list_page.dart';

class FindLawyerView extends StatefulWidget {
  const FindLawyerView({super.key});

  @override
  State<FindLawyerView> createState() => _FindLawyerViewState();
}

class _FindLawyerViewState extends State<FindLawyerView> {
  // Track selected tags for BEST LAWYER section
  Set<int> bestLawyerSelected = {0}; // First tag is selected by default
  // Track selected tags for SPECIALIST LAWYER section
  Set<int> specialistLawyerSelected = {0}; // First tag is selected by default

  void _toggleBestLawyerTag(int index) {
    setState(() {
      if (bestLawyerSelected.contains(index)) {
        bestLawyerSelected.remove(index);
      } else {
        bestLawyerSelected.add(index);
      }
    });
  }

  void _toggleSpecialistLawyerTag(int index) {
    setState(() {
      if (specialistLawyerSelected.contains(index)) {
        specialistLawyerSelected.remove(index);
      } else {
        specialistLawyerSelected.add(index);
      }
    });
  }

  void _onNext() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const LawyerListPage(title: 'Find lawyer'),
      ),
    );
  }

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
                      'Find lawyer',
                      style: AppTextStyles.robotoBold(
                        fontSize: 20,
                        color: const Color(0xFF333333),
                      ),
                    ),
                  ),
                ),
                // Placeholder for arrow (can be replaced with image if needed)
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
                  // BEST LAWYER section
                  Text(
                    'BEST LAWYER',
                    style: AppTextStyles.robotoBold(
                      fontSize: 20,
                      color: const Color(0xFF333333),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  // First row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: List.generate(4, (index) {
                      final isSelected = bestLawyerSelected.contains(index);
                      return Padding(
                        padding: EdgeInsets.only(
                          right: index < 3 ? screenWidth * 0.02 : 0,
                        ),
                        child: _LawyerTag(
                          label: 'Divorce',
                          isSelected: isSelected,
                          onTap: () => _toggleBestLawyerTag(index),
                        ),
                      );
                    }),
                  ),
                  SizedBox(height: screenHeight * 0.015),
                  // Second row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: List.generate(4, (index) {
                      final tagIndex = index + 4;
                      final isSelected = bestLawyerSelected.contains(tagIndex);
                      return Padding(
                        padding: EdgeInsets.only(
                          right: index < 3 ? screenWidth * 0.02 : 0,
                        ),
                        child: _LawyerTag(
                          label: 'Divorce',
                          isSelected: isSelected,
                          onTap: () => _toggleBestLawyerTag(tagIndex),
                        ),
                      );
                    }),
                  ),
                  SizedBox(height: screenHeight * 0.015),
                  // Third row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: List.generate(4, (index) {
                      final tagIndex = index + 8;
                      final isSelected = bestLawyerSelected.contains(tagIndex);
                      return Padding(
                        padding: EdgeInsets.only(
                          right: index < 3 ? screenWidth * 0.02 : 0,
                        ),
                        child: _LawyerTag(
                          label: 'Divorce',
                          isSelected: isSelected,
                          onTap: () => _toggleBestLawyerTag(tagIndex),
                        ),
                      );
                    }),
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  // SPECIALIST LAWYER section
                  Text(
                    'SPECIALIST LAWYER',
                    style: AppTextStyles.robotoBold(
                      fontSize: 20,
                      color: const Color(0xFF333333),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  // First row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: List.generate(4, (index) {
                      final isSelected = specialistLawyerSelected.contains(index);
                      return Padding(
                        padding: EdgeInsets.only(
                          right: index < 3 ? screenWidth * 0.02 : 0,
                        ),
                        child: _LawyerTag(
                          label: 'Divorce',
                          isSelected: isSelected,
                          onTap: () => _toggleSpecialistLawyerTag(index),
                        ),
                      );
                    }),
                  ),
                  SizedBox(height: screenHeight * 0.015),
                  // Second row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: List.generate(4, (index) {
                      final tagIndex = index + 4;
                      final isSelected = specialistLawyerSelected.contains(tagIndex);
                      return Padding(
                        padding: EdgeInsets.only(
                          right: index < 3 ? screenWidth * 0.02 : 0,
                        ),
                        child: _LawyerTag(
                          label: 'Divorce',
                          isSelected: isSelected,
                          onTap: () => _toggleSpecialistLawyerTag(tagIndex),
                        ),
                      );
                    }),
                  ),
                  SizedBox(height: screenHeight * 0.015),
                  // Third row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: List.generate(4, (index) {
                      final tagIndex = index + 8;
                      final isSelected = specialistLawyerSelected.contains(tagIndex);
                      return Padding(
                        padding: EdgeInsets.only(
                          right: index < 3 ? screenWidth * 0.02 : 0,
                        ),
                        child: _LawyerTag(
                          label: 'Divorce',
                          isSelected: isSelected,
                          onTap: () => _toggleSpecialistLawyerTag(tagIndex),
                        ),
                      );
                    }),
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  // Payment message
                  Center(
                    child: Text(
                      'Payment will be detucted after call.',
                      style: AppTextStyles.inter(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFFD9A22A),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  // Next button
                  Center(
                    child: SizedBox(
                      width: 360,
                      height: 56,
                      child: ElevatedButton(
                      onPressed: _onNext,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF333333),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        'Next',
                        style: AppTextStyles.inter(
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
        ],
      ),
    );
  }
}

class _LawyerTag extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _LawyerTag({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 23,
        width: 84,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF333333) : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? const Color(0xFF333333) : const Color(0xFFD9A22A),
            width: 1.5,
          ),
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

