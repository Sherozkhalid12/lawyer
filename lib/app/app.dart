import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_application_1/features/splash/presentation/pages/lawyer_lot_splash_page.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: TextTheme(
          // Regular text styles - Inter (15px, 500 weight)
          bodyLarge: GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.w500),
          bodyMedium: GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.w500),
          bodySmall: GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.w500),
          labelLarge: GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.w500),
          labelMedium: GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.w500),
          labelSmall: GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.w500),
          // Bold text styles - Roboto (20px, 700 weight)
          titleLarge: GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.w700),
          titleMedium: GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.w700),
          titleSmall: GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.w700),
          headlineLarge: GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.w700),
          headlineMedium: GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.w700),
          headlineSmall: GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.w700),
          displayLarge: GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.w700),
          displayMedium: GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.w700),
          displaySmall: GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.w700),
        ),
      ),
      home: const LawyerLotSplashPage(),
    );
  }
}


