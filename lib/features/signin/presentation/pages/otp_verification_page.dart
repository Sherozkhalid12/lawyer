import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/signin/presentation/widgets/otp_verification_view.dart';

class OtpVerificationPage extends StatelessWidget {
  final String phoneNumber;
  
  const OtpVerificationPage({
    super.key,
    required this.phoneNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: OtpVerificationView(phoneNumber: phoneNumber),
    );
  }
}

