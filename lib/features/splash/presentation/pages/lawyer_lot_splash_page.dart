import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:flutter_application_1/features/splash/presentation/widgets/lawyer_lot_splash_content.dart';

class LawyerLotSplashPage extends StatefulWidget {
  const LawyerLotSplashPage({super.key});

  @override
  State<LawyerLotSplashPage> createState() => _LawyerLotSplashPageState();
}

class _LawyerLotSplashPageState extends State<LawyerLotSplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      if (!mounted) return;
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => const OnboardingPage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: LawyerLotSplashContent(),
        ),
      ),
    );
  }
}



