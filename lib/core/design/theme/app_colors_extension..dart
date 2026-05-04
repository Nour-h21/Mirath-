import 'package:flutter/material.dart';

class AppColors extends ThemeExtension<AppColors> {
  final Color primary;
  final Color textPrimary;
  final Color background;
  final Color card;

  const AppColors({
    required this.primary,
    required this.textPrimary,
    required this.background,
    required this.card,
  });

  @override
  AppColors copyWith({
    Color? primary,
    Color? textPrimary,
    Color? background,
    Color? card,
  }) {
    return AppColors(
      primary: primary ?? this.primary,
      textPrimary: textPrimary ?? this.textPrimary,
      background: background ?? this.background,
      card: card ?? this.card,
    );
  }
  
  @override
  ThemeExtension<AppColors> lerp(covariant ThemeExtension<AppColors>? other, double t) {
    throw UnimplementedError();
  }
}
