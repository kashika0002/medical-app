import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryRed = Color(0xFFE23744); // Zomato red
  static const Color darkRed = Color(0xFFCB202D);
  static const Color lightRed = Color(0xFFFF6B6B);
  static const Color backgroundGray = Color(0xFFF8F8F8);
  static const Color textDark = Color(0xFF1C1C1C);
  static const Color textGray = Color(0xFF696969);
  static const Color textLight = Color(0xFF9B9B9B);
  static const Color borderGray = Color(0xFFE8E8E8);
  static const Color successGreen = Color(0xFF28A745);
  static const Color white = Colors.white;
}

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: AppColors.primaryRed,
      scaffoldBackgroundColor: AppColors.backgroundGray,
      colorScheme: ColorScheme.light(
        primary: AppColors.primaryRed,
        secondary: AppColors.darkRed,
        surface: AppColors.white,
        background: AppColors.backgroundGray,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColors.textDark),
        titleTextStyle: TextStyle(
          color: AppColors.textDark,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      cardTheme: CardTheme(
        color: AppColors.white,
        elevation: 2,
        shadowColor: Colors.black.withOpacity(0.1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryRed,
          foregroundColor: AppColors.white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight-semibold,
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primaryRed,
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight-semibold,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.borderGray),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.borderGray),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.primaryRed, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      fontFamily: 'Poppins',
    );
  }
}
