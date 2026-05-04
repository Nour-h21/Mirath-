import 'package:flutter/material.dart';
import 'package:mirath/core/utils/extensions/context_extensions.dart';

class AppTextStyles {

  static TextStyle bigBeigeStyle(BuildContext context) {
    return TextStyle(
      fontSize: context.sp(10), // 6% من العرض
      fontWeight: FontWeight.bold,
      color: context.colors.textPrimary,
    );
  }

}