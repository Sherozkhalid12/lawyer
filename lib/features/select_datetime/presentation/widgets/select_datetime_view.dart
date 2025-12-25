import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/text_styles.dart';
import 'package:flutter_application_1/features/booking/presentation/pages/booking_page.dart';

class SelectDateTimeView extends StatefulWidget {
  const SelectDateTimeView({super.key});

  @override
  State<SelectDateTimeView> createState() => _SelectDateTimeViewState();
}

class _SelectDateTimeViewState extends State<SelectDateTimeView> {
  Set<DateTime> _selectedDates = {
    DateTime(2023, 5, 4),
    DateTime(2023, 5, 8),
  };
  String? _selectedTimeSlot = '11.00 AM';
  DateTime _currentMonth = DateTime.now();

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
                      'Select Date & Time',
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
                  // Calendar Section
                  _buildCalendar(),
                  SizedBox(height: screenHeight * 0.04),
                  // Available Time Slot Section
                  Text(
                    'Available Time Slot',
                    style: AppTextStyles.robotoBold(
                      fontSize: 20,
                      color: const Color(0xFF333333),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  // Time slots
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _TimeSlotButton(
                          label: '10.00 AM',
                          isSelected: _selectedTimeSlot == '10.00 AM',
                          onTap: () => setState(() => _selectedTimeSlot = '10.00 AM'),
                        ),
                        const SizedBox(width: 12),
                        _TimeSlotButton(
                          label: '11.00 AM',
                          isSelected: _selectedTimeSlot == '11.00 AM',
                          onTap: () => setState(() => _selectedTimeSlot = '11.00 AM'),
                        ),
                        const SizedBox(width: 12),
                        _TimeSlotButton(
                          label: '12.00',
                          isSelected: _selectedTimeSlot == '12.00',
                          onTap: () => setState(() => _selectedTimeSlot = '12.00'),
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
                        builder: (context) => const BookingPage(),
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
                    'Set Appalment',
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

  Widget _buildCalendar() {
    final firstDayOfMonth = DateTime(_currentMonth.year, _currentMonth.month, 1);
    final lastDayOfMonth = DateTime(_currentMonth.year, _currentMonth.month + 1, 0);
    final firstDayWeekday = firstDayOfMonth.weekday;
    
    // Get previous month's last days
    final previousMonth = DateTime(_currentMonth.year, _currentMonth.month - 1);
    final lastDayOfPreviousMonth = DateTime(previousMonth.year, previousMonth.month + 1, 0);
    
    // Days of week
    final weekDays = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
    
    // Build calendar grid
    List<Widget> calendarDays = [];
    
    // Previous month's trailing days
    for (int i = firstDayWeekday - 1; i > 0; i--) {
      final day = lastDayOfPreviousMonth.day - i + 1;
      final date = DateTime(previousMonth.year, previousMonth.month, day);
      calendarDays.add(_buildCalendarDay(day, isCurrentMonth: false, isSelected: false, date: date));
    }
    
    // Current month's days
    for (int day = 1; day <= lastDayOfMonth.day; day++) {
      final date = DateTime(_currentMonth.year, _currentMonth.month, day);
      final isSelected = _selectedDates.any((selectedDate) =>
          selectedDate.year == date.year &&
          selectedDate.month == date.month &&
          selectedDate.day == date.day);
      calendarDays.add(_buildCalendarDay(day, isCurrentMonth: true, isSelected: isSelected, date: date));
    }
    
    // Next month's leading days (to fill the grid)
    final remainingDays = 42 - calendarDays.length; // 6 rows * 7 days
    final nextMonth = DateTime(_currentMonth.year, _currentMonth.month + 1, 1);
    for (int day = 1; day <= remainingDays; day++) {
      final date = DateTime(nextMonth.year, nextMonth.month, day);
      calendarDays.add(_buildCalendarDay(day, isCurrentMonth: false, isSelected: false, date: date));
    }

    final monthNames = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Month and Year header with navigation
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Previous month button
            IconButton(
              icon: const Icon(
                Icons.chevron_left,
                color: Color(0xFF333333),
                size: 24,
              ),
              onPressed: () {
                setState(() {
                  _currentMonth = DateTime(_currentMonth.year, _currentMonth.month - 1, 1);
                });
              },
            ),
            // Month name
            Text(
              monthNames[_currentMonth.month - 1],
              style: AppTextStyles.robotoBold(
                fontSize: 20,
                color: const Color(0xFF333333),
              ),
            ),
            // Year
            Text(
              _currentMonth.year.toString(),
              style: AppTextStyles.robotoBold(
                fontSize: 20,
                color: const Color(0xFFD9A22A),
              ),
            ),
            // Next month button
            IconButton(
              icon: const Icon(
                Icons.chevron_right,
                color: Color(0xFF333333),
                size: 24,
              ),
              onPressed: () {
                setState(() {
                  _currentMonth = DateTime(_currentMonth.year, _currentMonth.month + 1, 1);
                });
              },
            ),
          ],
        ),
        const SizedBox(height: 16),
        // Days of week header
        Row(
          children: weekDays.map((day) {
            return Expanded(
              child: Center(
                child: Text(
                  day,
                  style: AppTextStyles.robotoBold(
                    fontSize: 15,
                    color: const Color(0xFF333333),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 12),
        // Calendar grid
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
            childAspectRatio: 1,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
          ),
          itemCount: calendarDays.length,
          itemBuilder: (context, index) => calendarDays[index],
        ),
      ],
    );
  }

  Widget _buildCalendarDay(int day, {required bool isCurrentMonth, required bool isSelected, DateTime? date}) {
    return GestureDetector(
      onTap: isCurrentMonth && date != null
          ? () {
              setState(() {
                if (_selectedDates.contains(date)) {
                  _selectedDates.remove(date);
                } else {
                  _selectedDates.add(date);
                }
              });
            }
          : null,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFD9A22A) : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(
            day.toString(),
            style: AppTextStyles.inter(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: isSelected
                  ? Colors.white
                  : isCurrentMonth
                      ? const Color(0xFF333333)
                      : const Color(0xFF858585),
            ),
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
          color: isSelected
              ? const Color(0xFFD9A22A)
              : const Color(0xFFF5F5F5),
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

