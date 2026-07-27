import 'package:flutter/material.dart';
import 'package:mirath/core/design/tokens/colors.dart';
import 'package:mirath/core/utils/extensions/context_extensions.dart';

class AppTextStyles {
  static TextStyle displayLarge(BuildContext context) {
    return TextStyle(
      fontSize: context.sp(6), // ⬅️ أصغر وأجمل
      color: AppColors.primaryColor,
      fontWeight: FontWeight.bold,
      fontFamily: 'Arima',
    );
  }

  static TextStyle hintSmall(BuildContext context) {
    return TextStyle(
      fontSize: context.sp(3.5),
      color: AppColors.deepPrimaryColor,
      fontFamily: 'Arima',
    );
  }

  static TextStyle loginStyle(BuildContext context) {
    return TextStyle(
      color: AppColors.deepPrimaryColor,
      fontSize: context.sp(4.1),
      fontWeight: FontWeight.w600,
      fontFamily: 'Arima',
    );
  }

  static TextStyle labelStyle(BuildContext context) {
    return TextStyle(
      color: AppColors.secondryColor,
      fontSize: context.sp(3.4),
      fontWeight: FontWeight.w700,
      fontFamily: 'Arima',
    );
  }

  static TextStyle errorStyle(BuildContext context) {
    return TextStyle(
      color: Colors.red,
      fontSize: context.sp(3),
      fontFamily: 'Arima',
    );
  }

  static TextStyle login1Style(BuildContext context) {
    return TextStyle(
      color: AppColors.deepPrimaryColor,
      fontSize: context.sp(3.7),
      fontWeight: FontWeight.w600,
      fontFamily: 'Arima',
    );
  }

  static TextStyle login2Style(BuildContext context) {
    return TextStyle(
      color: AppColors.primaryColor,
      fontSize: context.sp(3.8),
      fontWeight: FontWeight.bold,
      fontFamily: 'Arima',
    );
  }

  static TextStyle login3Style(BuildContext context) {
    return TextStyle(
      color: AppColors.black,
      fontSize: context.sp(3.6),
      fontWeight: FontWeight.w600,
      fontFamily: 'Arima',
    );
  }

  static TextStyle googleLoginStyle(BuildContext context) {
    return TextStyle(
      color: AppColors.offPink,
      fontSize: context.sp(3.5),
      fontWeight: FontWeight.w600,
      fontFamily: 'Arima',
    );
  }

  static TextStyle authbuttonStyle(BuildContext context) {
    return TextStyle(
      color: AppColors.offWhite,
      fontSize: context.sp(4.6),
      fontWeight: FontWeight.w500,
      fontFamily: 'Arima',
    );
  }

  static TextStyle loginbuttonStyle(BuildContext context) {
    return TextStyle(
      color: AppColors.offWhite,
      fontSize: context.sp(4),
      fontWeight: FontWeight.w600,
      fontFamily: 'Arima',
    );
  }

  static TextStyle midDeepPrimaryColorStyle(BuildContext context) {
    return TextStyle(
      color: AppColors.deepPrimaryColor,
      fontSize: context.sp(4.5),
      fontWeight: FontWeight.w600,
      fontFamily: 'Arima',
    );
  }

  static TextStyle bigDeepPrimaryColorStyle(BuildContext context) {
    return TextStyle(
      color: AppColors.deepPrimaryColor,
      fontSize: context.sp(5.2),
      fontWeight: FontWeight.w800,
      height: 1.2,
      fontFamily: 'Arima',
    );
  }

   static TextStyle smallDeepPrimaryStyle(BuildContext context) {
    return TextStyle(
      color: AppColors.deepPrimaryColor,
      fontSize: context.sp(3.4),
      fontWeight: FontWeight.w500,
      fontFamily: 'Arima',
    );
  }

  static TextStyle smallBlack54Style(BuildContext context) {
    return TextStyle(
      color: AppColors.lightBlack,
      fontSize: context.sp(3.9),
      fontWeight: FontWeight.w500,
      fontFamily: 'Arima',
    );
  }
  static TextStyle numberPrimaryStyle(BuildContext context) {
    return TextStyle(
      color: AppColors.primaryColor,
      fontSize: context.sp(3.4),
      fontWeight: FontWeight.w500,
      fontFamily: 'Arima',
    );
  }
}
