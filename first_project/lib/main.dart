import 'package:first_project/core/theme/app_theme.dart';
import 'package:first_project/features/todo/presentation/pages/todo_page.dart';
import 'package:first_project/features/todo/presentation/pages/todo_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // Use your custom ThemeData from core
      theme: AppTheme.lightTheme.copyWith(
        useMaterial3: true, // Optional: enable Material 3
      ),
   
      themeMode: ThemeMode.system, // Automatically switch light/dark

      home: const TodoScreen(),
    );
  }
}
