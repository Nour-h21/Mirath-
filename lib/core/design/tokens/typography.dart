import 'package:flutter/material.dart';
import 'package:mirath/core/design/tokens/colors.dart';
import 'package:mirath/core/utils/extensions/context_extensions.dart';

class AppTextStyles {
  static TextStyle displayLarge(BuildContext context) {
    return TextStyle(
      fontSize: context.sp(6), // ⬅️ أصغر وأجمل
      color: AppColors.primaryColor,
      fontWeight: FontWeight.bold,
      fontFamily: 'Tajawal',
    );
  }

  static TextStyle hintSmall(BuildContext context) {
    return TextStyle(
      fontSize: context.sp(3.5),
      color: AppColors.deepPrimaryColor,
      fontFamily: 'Tajawal',
    );
  }

  static TextStyle labelStyle(BuildContext context) {
    return TextStyle(
      color: AppColors.secondryColor,
      fontSize: context.sp(4),
      fontWeight: FontWeight.w500,
      fontFamily: 'Tajawal',
    );
  }

  static TextStyle errorStyle(BuildContext context) {
    return TextStyle(
      color: Colors.red,
      fontSize: context.sp(3.4),
      fontFamily: 'Tajawal',
    );
  }

  static TextStyle loginStyle(BuildContext context) {
    return TextStyle(
      color: AppColors.deepPrimaryColor,
       fontSize: context.sp(4.1),
      fontWeight: FontWeight.w600,
      fontFamily: 'Tajawal',
    );
  }

  static TextStyle loginbuttonStyle(BuildContext context) {
    return TextStyle(
      color: AppColors.offWhite,
       fontSize: context.sp(4),
      fontWeight: FontWeight.w600,
      fontFamily: 'Tajawal',
    );
  }
}
