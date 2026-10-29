import 'package:cleaning_app/Resources/Colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.backgroundOfScreenColor,
    fontFamily: GoogleFonts.plusJakartaSans().fontFamily,

    textTheme: TextTheme(
      // Big Headings
      headlineLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: AppColors.blackColor),
      headlineMedium: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: AppColors.secondaryColor),
      headlineSmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.primaryColor),

      // Titles / Subtitles
      titleLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: AppColors.secondaryColor),
      titleMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.fieldAboveTextColor),
      titleSmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.secondaryColor),

      // Body Texts
      bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.blackColor),
      bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.blackColor),

      // Buttons
      labelLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
    ),
  );
}