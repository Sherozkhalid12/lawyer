import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  // Inter font for regular text - default 15px, 500 weight
  static TextStyle inter({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    double? letterSpacing,
    double? height,
  }) {
    return GoogleFonts.inter(
      fontSize: fontSize ?? 15,
      fontWeight: fontWeight ?? FontWeight.w500,
      color: color,
      letterSpacing: letterSpacing,
      height: height,
    );
  }

  // Roboto font for bold text - default 20px, 700 weight
  static TextStyle robotoBold({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    double? letterSpacing,
    double? height,
  }) {
    return GoogleFonts.roboto(
      fontSize: fontSize ?? 20,
      fontWeight: fontWeight ?? FontWeight.w700,
      color: color,
      letterSpacing: letterSpacing,
      height: height,
    );
  }

  // Helper that automatically chooses font based on fontWeight
  static TextStyle getStyle({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    double? letterSpacing,
    double? height,
  }) {
    final isBold = fontWeight == FontWeight.bold ||
        fontWeight == FontWeight.w600 ||
        fontWeight == FontWeight.w700 ||
        fontWeight == FontWeight.w800 ||
        fontWeight == FontWeight.w900;

    if (isBold) {
      return robotoBold(
        fontSize: fontSize ?? 20,
        fontWeight: fontWeight ?? FontWeight.w700,
        color: color,
        letterSpacing: letterSpacing,
        height: height,
      );
    } else {
      return inter(
        fontSize: fontSize ?? 15,
        fontWeight: fontWeight ?? FontWeight.w500,
        color: color,
        letterSpacing: letterSpacing,
        height: height,
      );
    }
  }
}

