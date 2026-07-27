import 'package:flutter/material.dart';
import 'package:mirath/core/design/tokens/typography.dart';
import 'package:mirath/core/utils/extensions/context_extensions.dart';

import '../../../../core/design/tokens/colors.dart';

class CatigoriesCard extends StatelessWidget {
  final String image;
  final String title;
  final VoidCallback onTap;
  const CatigoriesCard({super.key, required this.image, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap ,
      child: Padding(
        padding: EdgeInsets.only(top: context.h(1)),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: context.w(28),
                height: context.h(5.5),
                decoration: BoxDecoration(
                  color: AppColors.offWhite,
                  gradient: LinearGradient(
                    colors: [AppColors.baieg, AppColors.offWhite],
                  ),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    title,
                    style: AppTextStyles.login3Style(context).copyWith(
                      fontSize: context.sp(3.4),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: context.h(10.4),
                bottom: context.h(3.8),
                child: Image.asset(image, height: context.h(3.4)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
