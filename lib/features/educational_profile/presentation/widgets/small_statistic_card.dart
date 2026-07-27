import 'package:flutter/material.dart';
import 'package:mirath/core/design/tokens/colors.dart';
import 'package:mirath/core/utils/extensions/context_extensions.dart';

import '../../../../core/shared/widgets/cards/card_gradient_container.dart';

class SmallStatisticCard extends StatelessWidget {
  final String percentage;
  final String title;

  const SmallStatisticCard({
    super.key,
    required this.percentage,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return CardGradientContainer(
    width: context.w(25),
    height: context.h(8),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [

          CircleAvatar(
            radius: 14,
            backgroundColor: AppColors.primaryColor,

            child: Text(
              percentage,
              style: TextStyle(
                color: const Color.fromARGB(255, 222, 214, 207),
                fontSize: context.sp(2.8),
                fontFamily: 'Tajawal',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Text(
              title,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,

              style: TextStyle(
                color: AppColors.black,
                fontSize: context.sp(3),
                fontFamily: 'Tajawal',
                fontWeight: FontWeight.w600,
              ),

            ),
          ),
        ],
      ),
    );
  }
}