import 'package:flutter/material.dart';
import 'package:mirath/core/utils/extensions/context_extensions.dart';

import '../../../../core/design/tokens/colors.dart';
import '../../../../core/design/tokens/typography.dart';
import '../../../../core/shared/widgets/buttons/auth_button.dart';

class MotivationPlanCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final double progress;
  final VoidCallback onTapTasks;

  const MotivationPlanCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.progress,
    required this.onTapTasks,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.h(20),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          ClipPath(
            clipper: MotivationCardClipper(),
            child: Container(
              width: context.w(92),
              height: context.h(29),
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [AppColors.baieg, AppColors.grey, AppColors.offWhite],
                ),
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: context.h(1.2)),
                  Text(title, style: AppTextStyles.midDeepPrimaryColorStyle(context).copyWith(color: AppColors.black)),

                  SizedBox(height: context.h(0.7)),

                  Text(
                    subtitle,
                    style: AppTextStyles.smallBlack54Style(context),
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            bottom: context.h(13),
            left: context.w(7.2),
            child: TweenAnimationBuilder<double>(
              tween: Tween(begin: 0, end: progress),
              duration: const Duration(seconds: 1),
              curve: Curves.easeOutCubic,
              builder: (context, value, child) {
                return Container(
                  width: context.w(20.5),
                  height: context.h(9.5),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 20,
                        spreadRadius: 2,
                        color: Colors.black.withOpacity(.10),
                      ),
                    ],
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: context.w(16.7),
                        height: context.h(8.2),
                        child: CircularProgressIndicator(
                          value: value,
                          strokeWidth: 6,
                          strokeCap: StrokeCap.round,
                          backgroundColor: AppColors.greyWithShade200,
                          valueColor: AlwaysStoppedAnimation(
                            AppColors.primaryColor,
                          ),
                        ),
                      ),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${(value * 100).toInt()}%",
                            style:  TextStyle(
                              fontSize: context.h(2.8),
                              fontWeight: FontWeight.w800,
                            ),
                          ),

                           SizedBox(height: context.h(0.2),),

                          Text(
                            "إنجاز",
                            style: AppTextStyles.smallBlack54Style(context).copyWith(fontSize: context.sp(3)),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Positioned(
            bottom: 0,
           right: context.w(6),
            child: AuthButton(
              text: "الانتقال للمهام",
              onPressed: () {},
              height: context.h(3.8),
              width: context.w(30),
              textStyle: AppTextStyles.authbuttonStyle(
                context,
              ).copyWith(fontSize: context.sp(3.2)),
            ),
          ),
        ],
      ),
    );
  }
}

class MotivationCardClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, size.height - 55);

    /// LEFT CURVE
    path.quadraticBezierTo(
      size.width * 0.12,
      size.height - 5,
      size.width * 0.48,
      size.height - 18,
    );

    /// CENTER HOLE
    path.arcToPoint(
      Offset(size.width * 0.46, size.height - 18),
      radius: const Radius.circular(42),
      clockwise: false,
    );

    /// RIGHT CURVE
    path.quadraticBezierTo(
      size.width * 0.96,
      size.height - 52,
      size.width,
      size.height - 4,
    );

    path.lineTo(size.width, 0);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
