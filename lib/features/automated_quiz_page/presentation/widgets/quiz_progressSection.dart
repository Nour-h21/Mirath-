import 'package:flutter/material.dart';
import 'package:mirath/core/utils/extensions/context_extensions.dart';

import '../../../../core/design/tokens/colors.dart';
import '../../../../core/design/tokens/typography.dart';

class QuizProgressSection extends StatelessWidget {
  final int currentQuestion ;
  final int totalQuestions;

  const QuizProgressSection({
    super.key,
    required this.currentQuestion,
    required this.totalQuestions,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "$currentQuestion",
              style: AppTextStyles.midDeepPrimaryColorStyle(
                context,
              ).copyWith(fontSize: context.sp(3.7)),
            ),
            Text(
              " سؤال من ",
              style: AppTextStyles.midDeepPrimaryColorStyle(
                context,
              ).copyWith(fontSize: context.sp(3.7)),
            ),
            Text(
              "$totalQuestions",
              style: AppTextStyles.midDeepPrimaryColorStyle(
                context,
              ).copyWith(fontSize: context.sp(3.7)),
            ),
          ],
        ),

        SizedBox(height: context.h(.8)),

        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: LinearProgressIndicator(
            value: (currentQuestion.toDouble() / totalQuestions.toDouble())
                .clamp(0.0, 1.0),
            minHeight: context.h(0.8),
            color: AppColors.primaryColor,
            backgroundColor: AppColors.primaryColor.withOpacity(.15),
          ),
        ),
      ],
    );
  }
}
