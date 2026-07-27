import 'package:flutter/widgets.dart';
import 'package:mirath/core/design/tokens/colors.dart';
import 'package:mirath/core/utils/extensions/context_extensions.dart';
import 'package:mirath/core/utils/extensions/widget_extensions.dart';

import '../../../../core/design/tokens/typography.dart';

class QuizResultForm extends StatelessWidget {
  final String image;
  final String title;
  final String subTitle;
  final int quizResult;
  final int totalQuestion;
  final int percentResult;

  const QuizResultForm({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.quizResult,
    required this.percentResult,
    required this.totalQuestion,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: context.h(5)),
        Image.asset(image),
        SizedBox(height: context.h(2.5)),
        RichText(
          textAlign: TextAlign.center,
          textDirection: TextDirection.rtl,
          text: TextSpan(
            children: [
              TextSpan(
                text: '$title\n',
                style: AppTextStyles.bigDeepPrimaryColorStyle(context).copyWith(
                  fontSize: context.sp(8),
                  color: AppColors.primaryColor,
                ),
              ),
              TextSpan(
                text: subTitle,
                style: AppTextStyles.bigDeepPrimaryColorStyle(
                  context,
                ).copyWith(fontSize: context.sp(4)),
              ),
            ],
          ),
        ).paddingSymetricH(context, 4),
        SizedBox(height: context.h(6)),
        Container(
          height: context.h(8.5),
          width: context.w(55),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              colors: [AppColors.baieg, AppColors.offWhite, AppColors.grey],
            ),

            boxShadow: [
              BoxShadow(
                color: AppColors.grey,
                blurRadius: 5,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'نتيجة الاختبار',
                style: AppTextStyles.login3Style(context).copyWith(
                  fontSize: context.sp(4),
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: context.h(0.8)),
              Text(
                ' $totalQuestion / $quizResult',
                style: AppTextStyles.numberPrimaryStyle(
                  context,
                ).copyWith(fontSize: context.sp(4)),
              ),
            ],
          ),
        ),
        SizedBox(height: context.h(2)),
        Container(
          height: context.h(8.5),
          width: context.w(55),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              colors: [AppColors.baieg, AppColors.offWhite, AppColors.grey],
            ),

            boxShadow: [
              BoxShadow(
                color: AppColors.grey,
                blurRadius: 5,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'النسبة المئوية',
                style: AppTextStyles.login3Style(context).copyWith(
                 fontSize: context.sp(4),
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: context.h(0.8)),
              Text(
                '$percentResult %',
                style: AppTextStyles.numberPrimaryStyle(context).copyWith(fontSize: context.sp(4)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
