import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();
  // static const Color brandDarkBlue = Color.fromARGB(255, 16, 61, 101);
  static const Color bodyBackgroundColor = Color(0xFFF8FAFC);
  static const Color primaryColor = Colors.black;

  static ThemeData get lighTheme {
    return ThemeData(
      scaffoldBackgroundColor: bodyBackgroundColor,

      appBarTheme: AppBarTheme(
        backgroundColor: bodyBackgroundColor,
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.black26,
      ),

      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        surface: bodyBackgroundColor,
      ),
      // textTheme: TextTheme()
    );
  }
}
