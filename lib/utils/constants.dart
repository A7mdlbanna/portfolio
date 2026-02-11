import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color primary = Color(0xFF6C63FF); // Electric Violet
  static const Color secondary = Color(0xFF03DAC6); // Teal
  static const Color background = Color(0xFF0D1117); // Dark background (GitHub Dark)
  static const Color surface = Color(0xFF161B22); // Slightly lighter dark
  static const Color textPrimary = Color(0xFFF0F6FC); // Whiteish
  static const Color textSecondary = Color(0xFF8B949E); // Greyish
  static const Color accent = Color(0xFFFF4081); // Pink accent
}

class AppTextStyles {
  static TextStyle get header => GoogleFonts.outfit(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: AppColors.textPrimary,
      );
      
  static TextStyle get subHeader => GoogleFonts.outfit(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
      );
      
  static TextStyle get body => GoogleFonts.inter(
        fontSize: 16,
        color: AppColors.textSecondary,
        height: 1.5,
      );
}
