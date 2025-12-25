import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/signin/presentation/widgets/phone_verification_view.dart';

class PhoneVerificationPage extends StatelessWidget {
  const PhoneVerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: PhoneVerificationView(),
    );
  }
}

