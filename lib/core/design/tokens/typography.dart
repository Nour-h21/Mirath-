import 'package:flutter/material.dart';
import 'package:mirath/core/design/tokens/colors.dart';
import 'package:mirath/core/utils/extensions/context_extensions.dart';

class AppTextStyles {
  static TextStyle bigBeigeStyle(BuildContext context) {
    return TextStyle(
      fontSize: context.sp(10), // 6% من العرض
      fontWeight: FontWeight.bold,
      color: context.colors.textPrimary,
    );
  }

  static TextStyle labelStyle(BuildContext context) {
    return TextStyle(
      color: AppColors.secondryColor,
      fontSize: context.sp(3.4),
      fontWeight: FontWeight.w700,
      fontFamily: 'Tajawal',
    );
  }

  static TextStyle errorStyle(BuildContext context) {
    return TextStyle(
      color: Colors.red,
      fontSize: context.sp(3),
      fontFamily: 'Tajawal',
    );
  }

  static TextStyle login1Style(BuildContext context) {
    return TextStyle(
      color: AppColors.deepPrimaryColor,
      fontSize: context.sp(3.7),
      fontWeight: FontWeight.w600,
      fontFamily: 'Tajawal',
    );
  }

  static TextStyle login2Style(BuildContext context) {
    return TextStyle(
      color: AppColors.primaryColor,
      fontSize: context.sp(3.8),
      fontWeight: FontWeight.bold,
      fontFamily: 'Tajawal',
    );
  }

  static TextStyle login3Style(BuildContext context) {
    return TextStyle(
      color: AppColors.black,
      fontSize: context.sp(3.6),
      fontWeight: FontWeight.w600,
      fontFamily: 'Tajawal',
    );
  }

  static TextStyle googleLoginStyle(BuildContext context) {
    return TextStyle(
      color: AppColors.offPink,
      fontSize: context.sp(3.5),
      fontWeight: FontWeight.w600,
      fontFamily: 'Tajawal',
    );
  }

  static TextStyle authbuttonStyle(BuildContext context) {
    return TextStyle(
      color: AppColors.offWhite,
      fontSize: context.sp(4.6),
      fontWeight: FontWeight.w500,
      fontFamily: 'Tajawal',
    );
  }
}
