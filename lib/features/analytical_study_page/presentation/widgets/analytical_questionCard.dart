import 'package:flutter/material.dart';
import 'package:mirath/core/utils/extensions/context_extensions.dart';
import 'package:mirath/core/utils/extensions/widget_extensions.dart';

import '../../../../core/design/tokens/colors.dart';
import '../../../../core/design/tokens/typography.dart';

class AnalyticalQuestionCard extends StatelessWidget {
  final String question;

  const AnalyticalQuestionCard({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        Container(
          height: context.h(22),
          width: double.infinity,
          padding: EdgeInsets.all(context.h(2.2)),
          decoration: BoxDecoration(
            color: AppColors.offWhite,
            borderRadius: BorderRadius.circular(24),
            gradient: LinearGradient(
              end: Alignment.topLeft,
              begin: Alignment.bottomRight,
              colors: [
                AppColors.baieg,
                AppColors.grey,
                AppColors.offWhite,
                AppColors.grey,
                AppColors.offWhite,
                AppColors.baieg,
              ],
            ),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(.12), blurRadius: 20),
            ],
          ),
          child: Center(
            child: Text(
              question,
              style: AppTextStyles.midDeepPrimaryColorStyle(
                context,
              ).copyWith(fontSize: context.sp(4), color: AppColors.black),
            ).paddingOnlytop(context, 9),
          ),
        ),
        Padding(
        padding: EdgeInsets.only(bottom: context.h(18)),
          child: Container(
            height: context.h(17),
            width: context.w(17),
            decoration: BoxDecoration(
              color: AppColors.offWhite.withOpacity(0.4),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.quiz_rounded,
              color: AppColors.primaryColor,
              size: context.h(4.5),
            ),
          ),
        ),
      ],
    );
  }
}
