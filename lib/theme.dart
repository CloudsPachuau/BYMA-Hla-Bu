// theme.dart
import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  primarySwatch: Colors.cyan,
  brightness: Brightness.light,
  scaffoldBackgroundColor:
      Colors.grey.shade400, // Light theme global background
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.cyan.shade900,
    elevation: 10,
    iconTheme: const IconThemeData(color: Colors.white),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.cyan.shade900,
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.cyan.shade900,
  ),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Colors.grey.shade700, // Dark theme global background
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.brown.shade900,
    elevation: 10,
    iconTheme: const IconThemeData(color: Colors.white),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.brown.shade800,
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.brown.shade800,
  ),
  textTheme: const TextTheme(bodyLarge: TextStyle(color: Colors.white)),
);
