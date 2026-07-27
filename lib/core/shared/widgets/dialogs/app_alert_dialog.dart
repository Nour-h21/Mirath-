import 'package:flutter/material.dart';
import 'package:mirath/core/utils/extensions/context_extensions.dart';

import '../../../design/tokens/colors.dart';
import '../../../design/tokens/typography.dart';

class AppAlertDialog {
  static Future<void> show({
    required BuildContext context,
    required String message,
    required VoidCallback onPressed,
  }) {
    return showDialog(
      context: context,
      barrierColor: AppColors.black.withOpacity(0.12),
      builder: (_) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: AlertDialog(
            backgroundColor: AppColors.lightBaieg,
            title: Row(
              children: [
                Text("⚠️", style: TextStyle(fontSize: context.h(2.8))),
                SizedBox(width: context.w(1.5)),
                Text(
                  "تنبيه",
                  style: AppTextStyles.bigDeepPrimaryColorStyle(context),
                ),
              ],
            ),
            content: Text(
              message,
              style: AppTextStyles.smallBlack54Style(context),
            ),
            actions: [
              TextButton(
                onPressed: onPressed,
                child: Text(
                  "إغلاق",
                  style: AppTextStyles.midDeepPrimaryColorStyle(context)
                      .copyWith(
                        color: AppColors.primaryColor,
                        fontSize: context.sp(3.8),
                      ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
