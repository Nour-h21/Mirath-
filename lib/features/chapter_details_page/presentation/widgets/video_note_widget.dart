
import 'package:flutter/material.dart';
import 'package:mirath/core/utils/extensions/context_extensions.dart';

import '../../../../core/design/tokens/colors.dart';
import '../../../../core/design/tokens/typography.dart';

class VideoNoteWidget extends StatelessWidget {
  const VideoNoteWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(context.w(2.5)),
          decoration: BoxDecoration(
            color: AppColors.primaryColor.withOpacity(.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.lightbulb_outline_rounded,
            color: AppColors.primaryColor,
            size: context.sp(6),
          ),
        ),
        SizedBox(width: context.w(3)),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "نصيحة",
                style: AppTextStyles.midDeepPrimaryColorStyle(
                  context,
                ).copyWith(fontSize: context.sp(4)),
              ),
              SizedBox(height: context.h(.5)),
              Text(
                "يمكنك الاستفادة بشكل أكبر من المحتوى من خلال تدوين أهم الأفكار والملاحظات أثناء القراءة أو المشاهدة والرجوع إليها لاحقًا.",
                style: AppTextStyles.smallBlack54Style(
                  context,
                ).copyWith(height: 1.6),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
