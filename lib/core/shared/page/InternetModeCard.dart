import 'package:flutter/material.dart';
import 'package:mirath/core/utils/extensions/context_extensions.dart';

import '../widgets/cards/base_card.dart';
import '../../design/tokens/colors.dart';

class InternetModeCard extends StatelessWidget {
  final bool isOnline;
  final ValueChanged<bool> onChanged;

  const InternetModeCard({
    super.key,
    required this.isOnline,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      padding: EdgeInsets.symmetric(
        horizontal: context.w(2),
        vertical: context.h(0.5), // أصغر
      ),
      borderColor: isOnline ? AppColors.primaryColor : Colors.grey,
      gradient: isOnline
          ? LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [AppColors.baieg, AppColors.offWhite],
            )
          : LinearGradient(
              // colors: [Colors.grey.shade300, Colors.grey.shade200],
              colors: [AppColors.transparent, AppColors.transparent],
            ),
      child: Row(
        children: [
          SizedBox(width: context.w(1)),
          Icon(
            isOnline ? Icons.wifi_off : Icons.wifi,
            color: isOnline ? AppColors.primaryColor : Colors.grey,
          ),

          SizedBox(width: context.w(3)),

          Text(
            // isOnline
            "الخطة تعمل بدون الإنترنت",
            // : "الخطة تعمل مع إنترنت",
          ),
          // SizedBox(   width:  isOnline ? context.w(22) : context.w(25.5) ),
          // SizedBox(width: context.w(22)),
          Spacer(),
          Transform.scale(
            scale: 1.08,
            child: Switch.adaptive(
              activeColor: AppColors.offWhite,
              activeTrackColor: AppColors.primaryColor,

              inactiveThumbColor: AppColors.grey,
              inactiveTrackColor: AppColors.transparent,

              value: isOnline,
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
