import 'package:flutter/material.dart';
import 'package:mirath/core/utils/extensions/context_extensions.dart';

import '../../../../core/design/tokens/colors.dart';
import '../../../../core/design/tokens/typography.dart';

class QuizAnswerCard extends StatelessWidget {
  final String text;
  final bool isSelected;
  final bool isCorrect;
  final bool showResult;
  final VoidCallback onTap;

  const QuizAnswerCard({
    super.key,
    required this.text,
    required this.isSelected,
    required this.isCorrect,
    required this.showResult,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Color background = AppColors.offWhite;

    // Color border =
    //     AppColors.primaryColor;

    Widget? icon;

    if (showResult) {
      if (isCorrect) {
        background = Colors.green.shade50;

        // border = Colors.green;

        icon = const Icon(Icons.check_circle, color: Colors.green);
      } else if (isSelected) {
        background = Colors.red.shade50;

        // border = Colors.red;

        icon = const Icon(Icons.cancel, color: Colors.red);
      }
    }

    return InkWell(
      onTap: showResult ? null : onTap,
      borderRadius: BorderRadius.circular(22),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: EdgeInsets.only(bottom: context.h(1.5)),
        padding: EdgeInsets.all(context.h(2)),
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(22),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(.12), blurRadius: 4),
          ],
          // border: Border.all(
          //   color: border,
          //   width: 1.5,
          // ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                text,
                style: AppTextStyles.smallBlack54Style(context).copyWith(color: AppColors.black),
              ),
            ),
            if (icon != null) icon,
          ],
        ),
      ),
    );
  }
}
