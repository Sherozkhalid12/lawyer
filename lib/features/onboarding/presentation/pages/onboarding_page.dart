import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/onboarding/presentation/widgets/onboarding_view.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: OnboardingView()),
    );
  }
}
