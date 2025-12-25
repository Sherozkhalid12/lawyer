import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/signin/presentation/pages/complete_registration_page.dart';

class OtpVerificationView extends StatefulWidget {
  final String phoneNumber;
  
  const OtpVerificationView({
    super.key,
    required this.phoneNumber,
  });

  @override
  State<OtpVerificationView> createState() => _OtpVerificationViewState();
}

class _OtpVerificationViewState extends State<OtpVerificationView> {
  final List<TextEditingController> _controllers = List.generate(
    4,
    (index) => TextEditingController(),
  );
  final List<FocusNode> _focusNodes = List.generate(
    4,
    (index) => FocusNode(),
  );
  String _otpCode = '';

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  void _onVerify() {
    if (_otpCode.length == 4) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => CompleteRegistrationPage(
            phoneNumber: widget.phoneNumber,
          ),
        ),
      );
    }
  }

  void _onResendSms() {
    // TODO: Implement resend SMS logic
  }

  void _onWrongNumber() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenHeight = size.height;
    final screenWidth = size.width;

    return Container(
      width: double.infinity,
      color: Colors.white,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.06,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: screenHeight * 0.03),
              // Back arrow
              Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: Color(0xFF333333),
                    size: 20,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.025),
              // Title
              const Text(
            'Verify Phone Number',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Color(0xFF333333),
            ),
          ),
          SizedBox(height: screenHeight * 0.025),
          // Instructions
          const Text(
            'Please enter the 4 digit code sent to',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0xFF333333),
              height: 1.4,
            ),
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
          SizedBox(height: screenHeight * 0.04),
          // OTP input fields
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(4, (index) {
              return Container(
                margin: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.02,
                ),
                width: screenWidth * 0.12,
                child: TextField(
                  controller: _controllers[index],
                  focusNode: _focusNodes[index],
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  maxLength: 1,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF333333),
                  ),
                  decoration: const InputDecoration(
                    counterText: '',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF333333),
                        width: 2,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF333333),
                        width: 2,
                      ),
                    ),
                  ),
                  onChanged: (value) {
                    if (value.isNotEmpty && index < 3) {
                      _focusNodes[index + 1].requestFocus();
                    }
                    setState(() {
                      _otpCode = _controllers.map((c) => c.text).join();
                    });
                  },
                ),
              );
            }),
          ),
          SizedBox(height: screenHeight * 0.04),
          // Action links
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Didn't recieve a code?",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF333333),
                ),
              ),
              const SizedBox(width: 4),
              GestureDetector(
                onTap: _onResendSms,
                child: const Text(
                  'Resend SMS',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFFFF9800),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.01),
          GestureDetector(
            onTap: _onWrongNumber,
            child: const Text(
              'Wrong number',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xFF333333),
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.04),
          // Verify button
          Center(
            child: SizedBox(
              width: 360,
              height: 56,
              child: ElevatedButton(
                onPressed: _onVerify,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF333333),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'Verify number',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.03),
          // Legal disclaimer
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "By continuing you're indicating that you accept our",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF333333),
                ),
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.005),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  // TODO: Navigate to Terms of Use
                },
                child: const Text(
                  'Terms of Use',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFFFF9800),
                  ),
                ),
              ),
              const Text(
                ' and ',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF333333),
                ),
              ),
              GestureDetector(
                onTap: () {
                  // TODO: Navigate to Privacy Policy
                },
                child: const Text(
                  'Privacy Policy',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFFFF9800),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
    ),
    );
  }
}

