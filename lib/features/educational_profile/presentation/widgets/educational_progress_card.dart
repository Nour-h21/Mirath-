import 'package:flutter/material.dart';
import 'package:mirath/core/design/tokens/colors.dart';
import 'package:mirath/core/utils/extensions/context_extensions.dart';
import 'package:mirath/core/utils/extensions/widget_extensions.dart';

import '../../../../core/shared/widgets/cards/card_gradient_border.dart';

class EducationalProgressCard extends StatelessWidget {
  final String title;
  final String date;
  final double progress;

  const EducationalProgressCard({
    super.key,
    required this.title,
    required this.date,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return CardGradientBorder(
      width: context.w(90),
      height: context.h(10.5),
      // useGradient: true,
      // color: const Color.fromARGB(255, 237, 235, 229),
    useGradient: true,

      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),

        child: Row(
          children: [
            /// دائرة التقدم
            Stack(
              alignment: Alignment.center,

              children: [
                SizedBox(
                  width: 60,
                  height: 60,

                  child: CircularProgressIndicator(
                    value: progress,
                    strokeWidth: 6,
                    color: AppColors.primaryColor,
                    backgroundColor: AppColors.grey,
                  ),
                ),

                Text(
                  "${(progress * 100).toInt()}%",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),

            SizedBox(width: context.w(8)),

            /// البيانات
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: context.sp(4),
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ),

                  SizedBox(height: context.h(1)),

                  Container(
                    padding: context.paddingSymmetric(0.5, 2),

                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(12),
                    ),

                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.calendar_month_outlined,
                          size: context.sp(3.5),
                          color: AppColors.baieg,
                        ),

                        SizedBox(width: context.w(1.5)),

                        Text(
                          date,
                          style: TextStyle(
                            fontSize: context.sp(2.6),
                            color: AppColors.baieg,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
