import 'package:flutter/material.dart';

class AppTheme{
  
  static const Color primaryColorMario = Colors.redAccent;
  static const Color primaryColor = Color(0xFF674AEF);
  static const Color secondaryColor = Colors.white;
  static const Color primaryColorLuigi = Colors.green;
  static final Color primaryColorBowser = Colors.amber[600]!;
  
  static final ThemeData lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: Colors.white,
  );
}