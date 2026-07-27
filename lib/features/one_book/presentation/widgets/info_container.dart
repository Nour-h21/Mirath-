import 'package:flutter/material.dart';
import 'package:mirath/core/design/tokens/colors.dart';
import 'package:mirath/core/utils/extensions/context_extensions.dart';

import '../../../../core/design/tokens/typography.dart';

class InfoContainer extends StatelessWidget {
  final String title;
  final String subTitle;
  const InfoContainer({super.key, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.h(5.5),
      width: context.w(25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(colors: [AppColors.baieg, AppColors.offWhite,AppColors.grey]),

        boxShadow: [
          BoxShadow(color: Colors.grey, blurRadius: 5, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
           title,
            style: AppTextStyles.login3Style(context).copyWith(
              fontSize: context.sp(3.4),
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: context.h(0.5)),
          Text(
            subTitle,
            style: AppTextStyles.numberPrimaryStyle(context)
          ),
        ],
      ),
    );
  }
}
