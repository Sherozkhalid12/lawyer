import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/home/presentation/pages/home_page.dart';

class CompleteRegistrationView extends StatefulWidget {
  final String phoneNumber;
  
  const CompleteRegistrationView({
    super.key,
    required this.phoneNumber,
  });

  @override
  State<CompleteRegistrationView> createState() => _CompleteRegistrationViewState();
}

class _CompleteRegistrationViewState extends State<CompleteRegistrationView> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _dateOfBirthController = TextEditingController();
  final TextEditingController _aboutController = TextEditingController();
  final GlobalKey _genderKey = GlobalKey();

  @override
  void dispose() {
    _fullNameController.dispose();
    _genderController.dispose();
    _dateOfBirthController.dispose();
    _aboutController.dispose();
    super.dispose();
  }

  void _onSubmit() {
    if (_fullNameController.text.isNotEmpty &&
        _genderController.text.isNotEmpty &&
        _dateOfBirthController.text.isNotEmpty &&
        _aboutController.text.isNotEmpty) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
        (route) => false,
      );
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xFFD9A22A), // Gold color
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        _dateOfBirthController.text =
            '${picked.day}/${picked.month}/${picked.year}';
      });
    }
  }

  void _showGenderBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Handle bar
              Container(
                margin: const EdgeInsets.only(top: 12, bottom: 8),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              // Title
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Select Gender',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF333333),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close, color: Color(0xFF333333)),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),
              const Divider(height: 1),
              // Gender options
              _buildGenderOption('Male', context),
              const Divider(height: 1, indent: 20, endIndent: 20),
              _buildGenderOption('Female', context),
              const Divider(height: 1, indent: 20, endIndent: 20),
              _buildGenderOption('Other', context),
              SizedBox(height: MediaQuery.of(context).padding.bottom + 16),
            ],
          ),
        );
      },
    );
  }

  Widget _buildGenderOption(String gender, BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _genderController.text = gender;
        });
        Navigator.pop(context);
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Text(
          gender,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Color(0xFF333333),
          ),
        ),
      ),
    );
  }

  Widget _buildTriangleIcon() {
    return CustomPaint(
      size: const Size(12, 8),
      painter: _TrianglePainter(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenHeight = size.height;
    final screenWidth = size.width;

    return SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.06,
            ),
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.03),
              // Back arrow
              GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Color(0xFF333333),
                  size: 20,
                ),
              ),
              SizedBox(height: screenHeight * 0.025),
              // Title
              const Center(
                child: Text(
                  'Complete Registration',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF333333),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.04),
              // Phone verification status
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    'Your phone number has been verified',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF333333),
                    ),
                  ),
                  const SizedBox(width: 6),
                  const Icon(
                    Icons.check_circle,
                    color: Color(0xFF2196F3),
                    size: 18,
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.01),
              // Phone number
              Text(
                widget.phoneNumber,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF333333),
                ),
              ),
              SizedBox(height: screenHeight * 0.05),
              // Full Name field
              const Text(
                'Full Name',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF333333),
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              Container(
                height: 52,
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: const Color(0xFFE0E0E0),
                    width: 1,
                  ),
                ),
                child: TextField(
                  controller: _fullNameController,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF333333),
                  ),
                  decoration: const InputDecoration(
                    hintText: 'Please Pick Something',
                    hintStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF9E9E9E),
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.025),
              // Select Gender field
              const Text(
                'Select Gender',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF333333),
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              GestureDetector(
                onTap: () => _showGenderBottomSheet(context),
                child: Container(
                  key: _genderKey,
                  height: 52,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF0F2F4), // Background color for typing
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: const Color(0xFFE0E0E0),
                      width: 1,
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _genderController,
                          enabled: false,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF333333),
                          ),
                          decoration: const InputDecoration(
                            hintText: 'Please Pick Something',
                            hintStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF9E9E9E),
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.zero,
                          ),
                        ),
                      ),
                      _buildTriangleIcon(),
                    ],
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.025),
              // Date of Birth field
              const Text(
                'Date of Birth',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF333333),
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              GestureDetector(
                onTap: () => _selectDate(context),
                child: Container(
                  height: 52,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F5F5),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: const Color(0xFFE0E0E0),
                      width: 1,
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _dateOfBirthController,
                          enabled: false,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF333333),
                          ),
                          decoration: const InputDecoration(
                            hintText: 'Please Pick Something',
                            hintStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF9E9E9E),
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.zero,
                          ),
                        ),
                      ),
                      const Icon(
                        Icons.calendar_today,
                        color: Color(0xFFD9A22A), // Gold color
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.025),
              // About field
              const Text(
                'About',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF333333),
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              Container(
                height: 120,
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: const Color(0xFFE0E0E0),
                    width: 1,
                  ),
                ),
                child: TextField(
                  controller: _aboutController,
                  maxLines: null,
                  expands: true,
                  textAlignVertical: TextAlignVertical.top,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF333333),
                  ),
                  decoration: const InputDecoration(
                    hintText: 'Right come thing about your self',
                    hintStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF9E9E9E),
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(16),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.05),
              // Submit button
              SizedBox(
                width: 360,
                height: 56,
                child: ElevatedButton(
                  onPressed: _onSubmit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF333333),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Submit Now',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.04),
            ],
          ),
        ),
      ),
    );
  }
}

class _TrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFD9A22A) // Gold color
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(size.width / 2, size.height);
    path.lineTo(0, 0);
    path.lineTo(size.width, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

