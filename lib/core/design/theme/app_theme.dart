import 'package:flutter/material.dart';

import 'app_colors_extension..dart';

class AppTheme {
  static ThemeData light = ThemeData(
    brightness: Brightness.light,
    extensions: const [
      ThemeColors(
        primary: Colors.blue,
        textPrimary: Colors.black,
        background: Colors.white,
        card: Color(0xFFF5F5F5),
      ),
    ],
  );

  static ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    extensions: const [
      ThemeColors(
        primary: Colors.blue,
        textPrimary: Colors.white,
        background: Colors.black,
        card: Color(0xFF1E1E1E),
      ),
    ],
  );
}