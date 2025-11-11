import 'package:first_project/core/theme/custom_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: Colors.blue,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
      elevation: 4,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
    ),
    textTheme: const TextTheme(
      titleMedium: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      bodyMedium: TextStyle(color: Colors.grey),
    ),
    scaffoldBackgroundColor: Colors.grey.shade100,
    extensions: const [
      CustomColors(
        cardBackground: Color(0xFFF5F5F5), // light gray
        tagExcellent: Color(0xFF4CAF50), // light green
        tagGood: Color(0xFFFFEB3B),      // yellow
        tagPoor: Color(0xFFF44336),      // red
        containerBackground: Color(0xFFFFFFFF), // white container background
      ),
    ],
  );
}
