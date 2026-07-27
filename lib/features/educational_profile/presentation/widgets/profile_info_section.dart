import 'package:flutter/material.dart';
import 'package:mirath/core/utils/extensions/context_extensions.dart';
import 'package:mirath/core/utils/extensions/widget_extensions.dart';

import '../../../../core/constants/assets.dart';
import '../../../../core/design/tokens/colors.dart';
import '../../../../core/design/tokens/typography.dart';

class ProfileInfoSection extends StatelessWidget {
  final String userName;
  final int userPoints;
  final String image;
  const ProfileInfoSection({
    super.key,
    required this.userName,
    required this.userPoints,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(radius: 40, backgroundImage: AssetImage(image)),

        SizedBox(width: context.w(8)),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(userName, style: AppTextStyles.userName(context)),

              SizedBox(height: context.h(1.5)),

              Container(
                padding: context.paddingSymmetric(0.1, 4),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x20000000),
                      blurRadius: 1,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      AppAssets.iconssss,
                      width: context.w(3),
                      height: context.h(3),
                    ),

                    const SizedBox(width: 5),

                    Text(
                      '${userPoints}',
                      style: AppTextStyles.userPoints(context),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
