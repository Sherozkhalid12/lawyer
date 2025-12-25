import 'package:flutter/material.dart';

class LawyerLotSplashContent extends StatelessWidget {
  const LawyerLotSplashContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        'assets/images/lawyer_lot_logo.png',
        width: MediaQuery.of(context).size.width * 0.45,
        fit: BoxFit.contain,
      ),
    );
  }
}


