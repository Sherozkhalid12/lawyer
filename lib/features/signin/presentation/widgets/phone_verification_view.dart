import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/features/signin/presentation/pages/otp_verification_page.dart';

class PhoneVerificationView extends StatefulWidget {
  const PhoneVerificationView({super.key});

  @override
  State<PhoneVerificationView> createState() => _PhoneVerificationViewState();
}

class _PhoneVerificationViewState extends State<PhoneVerificationView> {
  final TextEditingController _phoneController = TextEditingController();
  String _selectedCountryCode = '+880';

  void _onContinue() {
    final phoneNumber = _phoneController.text;
    if (phoneNumber.isNotEmpty) {
      final fullPhoneNumber = '$_selectedCountryCode$phoneNumber';
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => OtpVerificationPage(
            phoneNumber: fullPhoneNumber,
          ),
        ),
      );
    }
  }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenHeight = size.height;
    final screenWidth = size.width;

    return Column(
      children: [
        // Upper section with portrait (reduced image area)
        Container(
          height: screenHeight * 0.52,
          width: double.infinity,
          color: const Color(0xFF2C2C2C),
          child: Stack(
            children: [
              // Portrait image - centered and positioned slightly to the right
              Center(
                child: Padding(
                  padding: EdgeInsets.only(left: screenWidth * 0.08),
                  child: Image.asset(
                    'assets/images/girl.png',
                    fit: BoxFit.cover,
                    height: screenHeight * 0.52,
                    width: screenWidth * 0.7,
                  ),
                ),
              ),
            ],
          ),
        ),
        // Lower section with form (40-45% of screen height)
        Expanded(
          child: Container(
            width: double.infinity,
            color: Colors.white,
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.08,
              vertical: screenHeight * 0.04,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Instructional text
                const Text(
                  'Enter your phone number to continue',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF2C2C2C),
                    height: 1.4,
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
                RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF2C2C2C),
                      height: 1.5,
                    ),
                    children: [
                      TextSpan(text: 'we will send an '),
                      TextSpan(
                        text: 'OTP',
                        style: TextStyle(
                          color: Color(0xFFFF9800),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(text: ' for verification'),
                    ],
                  ),
                ),
                SizedBox(height: screenHeight * 0.035),
                // Input field label
                const Text(
                  'Enter mobile no.*',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF2C2C2C),
                  ),
                ),
                SizedBox(height: screenHeight * 0.015),
                // Phone number input fields
                Row(
                  children: [
                    // Country code dropdown
                    Container(
                      width: screenWidth * 0.25,
                      height: 52,
                      decoration: BoxDecoration(
                        color: const Color(0xFF2C2C2C),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            // TODO: Show country code picker
                          },
                          borderRadius: BorderRadius.circular(8),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  _selectedCountryCode,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                                const Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.white,
                                  size: 24,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.03),
                    // Phone number input
                    Expanded(
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
                        child: TextField(
                          controller: _phoneController,
                          keyboardType: TextInputType.phone,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF2C2C2C),
                          ),
                          decoration: const InputDecoration(
                            hintText: '123456789000',
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
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.05),
                // Continue button
                Center(
                  child: SizedBox(
                    width: 360,
                    height: 56,
                    child: ElevatedButton(
                    onPressed: _onContinue,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2C2C2C),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      'Continue',
                      style: TextStyle(
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
        ),
      ],
    );
  }
}

