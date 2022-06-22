import 'package:flutter/material.dart';

abstract class _ThemeColors {
  static const _prColNum = 0xFF7210FF;
  static const MaterialColor primaryColor =
      MaterialColor(_prColNum, <int, Color>{
    100: Color(0xFFF1E7FF),
    500: Color(_prColNum),
  });
}

class MyTheme {
  static final lightTheme = ThemeData(
    fontFamily: 'Urbanist',
    primaryColor: _ThemeColors.primaryColor,
    colorScheme: const ColorScheme.light(),
    appBarTheme: const AppBarTheme(
      titleTextStyle:
          TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
      backgroundColor: Colors.white,
    ),
    scaffoldBackgroundColor: Colors.white,
    cardTheme: const CardTheme(
      clipBehavior: Clip.antiAlias,
    ),
  );

  static final darkTheme = ThemeData(
    primaryColor: _ThemeColors.primaryColor,
    colorScheme: const ColorScheme.dark(),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: Color(0xFF1F222A),
    ),
    scaffoldBackgroundColor: const Color(0xFF1F222A),
    cardTheme: const CardTheme(
      clipBehavior: Clip.antiAlias,
      color: Color(0xFF35383F),
    ),
  );
}
