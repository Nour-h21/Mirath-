import 'package:flutter/material.dart';

class ThemeColors extends ThemeExtension<ThemeColors> {
  final Color primary;
  final Color textPrimary;
  final Color background;
  final Color card;

  const ThemeColors({
    required this.primary,
    required this.textPrimary,
    required this.background,
    required this.card,
  });

  @override
  ThemeColors copyWith({
    Color? primary,
    Color? textPrimary,
    Color? background,
    Color? card,
  }) {
    return ThemeColors(
      primary: primary ?? this.primary,
      textPrimary: textPrimary ?? this.textPrimary,
      background: background ?? this.background,
      card: card ?? this.card,
    );
  }
  
  @override
  ThemeExtension<ThemeColors> lerp(covariant ThemeExtension<ThemeColors>? other, double t) {
    throw UnimplementedError();
  }
}
