import 'package:flutter/material.dart';

class AppTheme {
  // Light Theme
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
  );

  // Optional: Dark Theme
  static ThemeData darkTheme = ThemeData.dark();
}
