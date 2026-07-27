import 'package:flutter/material.dart';
import 'package:mirath/core/utils/extensions/context_extensions.dart';
import 'package:mirath/core/utils/extensions/widget_extensions.dart';

import '../../../../core/design/tokens/colors.dart';
import '../../../../core/design/tokens/typography.dart';
import '../../domain/entities/one_book_page_entity.dart';

class ChapterCard extends StatelessWidget {
  final String title;
  final double progress;
  final int index;
  final ChapterState state;
  final bool isBookmarked;
  final VoidCallback onPressed;
  final VoidCallback onBookmarkTap;

  const ChapterCard({
    super.key,
    required this.title,
    required this.progress,
    required this.index,
    required this.state,
    required this.isBookmarked,
    required this.onBookmarkTap,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: onBookmarkTap,
              child: Icon(
                isBookmarked ? Icons.bookmark : Icons.bookmark_outline,
                size: context.h(3.8),
                color: AppColors.primaryColor,
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: onPressed,
                child: ClipPath(
                  clipper: TopLeftNotchClipper(),
                  child: Padding(
                    padding: EdgeInsets.only(top: context.h(0.9)),
                    child: Container(
                      height: context.h(8),
                      width: context.w(90),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: LinearGradient(
                          colors: [
                            AppColors.baieg,
                            AppColors.offWhite,
                            AppColors.grey,
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 5,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),

                      child: ListTile(
                        leading: Container(
                          height: context.h(12),
                          width: context.w(9),
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/image18.png'),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "$index",
                              style: AppTextStyles.numberPrimaryStyle(
                                context,
                              ).copyWith(color: AppColors.offWhite),
                            ),
                          ),
                        ),
                        title: Text(
                          title,
                          style: AppTextStyles.smallDeepPrimaryStyle(
                            context,
                          ).copyWith(color: AppColors.black),
                        ),
                      ),
                    ).paddingAll(context, 1.6),
                  ),
                ),
              ),
            ),
          ],
        ),
        _buildStatusWidget(context),
      ],
    );
  }

  Widget _buildStatusWidget(BuildContext context) {
    // LOCK
    if (state == ChapterState.locked) {
      return Positioned(
        top: context.h(1),
        left: context.h(6.4),
        child: Icon(
          Icons.lock,
          size: context.h(3.5),
          color: AppColors.primaryColor,
        ),
      );
    }

    // COMPLETED
    if (state == ChapterState.completed) {
      return Positioned(
        top: context.h(1),
        left: context.h(6),
        child: Icon(
          Icons.check_circle_outline,
          size: context.h(4),
          color: Colors.green,
        ),
      );
    }

    // PROGRESS
    return Positioned(
      top: context.h(-0.1),
      left: context.h(5.2),
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: 0, end: progress),
        duration: const Duration(seconds: 1),
        curve: Curves.easeOutCubic,

        builder: (context, value, child) {
          return Container(
            width: context.w(11),
            height: context.h(5.5),
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
                  width: context.w(9),
                  height: context.h(4.5),
                  child: CircularProgressIndicator(
                    value: value,
                    strokeWidth: 2.5,
                    strokeCap: StrokeCap.round,
                    backgroundColor: AppColors.greyWithShade200,
                    valueColor: AlwaysStoppedAnimation(AppColors.primaryColor),
                  ),
                ),
                Text(
                  "${(value * 100).toInt()}%",
                  style: TextStyle(
                    fontSize: context.h(1.85),
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class TopLeftNotchClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    // البداية
    path.moveTo(0, 0);

    // قبل الحفرة
    path.lineTo(25, 0);

    // النزول للحفرة
    path.quadraticBezierTo(40, 0, 45, 20);

    // أعمق نقطة
    path.quadraticBezierTo(60, 58, 84, 20);

    // الخروج من الحفرة
    path.quadraticBezierTo(90, 0, 180, 0);

    // بقية الكارد
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
