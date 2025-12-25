import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/signin/presentation/widgets/complete_registration_view.dart';

class CompleteRegistrationPage extends StatelessWidget {
  final String phoneNumber;
  
  const CompleteRegistrationPage({
    super.key,
    required this.phoneNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CompleteRegistrationView(phoneNumber: phoneNumber),
    );
  }
}

