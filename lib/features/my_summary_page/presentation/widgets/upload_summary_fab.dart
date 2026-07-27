import 'package:flutter/material.dart';
import 'package:mirath/core/utils/extensions/context_extensions.dart';

import '../../../../core/design/tokens/colors.dart';
import '../../../../core/design/tokens/typography.dart';

class UploadSummaryFab extends StatefulWidget {
  final VoidCallback onTap;

  const UploadSummaryFab({super.key, required this.onTap});

  @override
  State<UploadSummaryFab> createState() => _UploadSummaryFabState();
}

class _UploadSummaryFabState extends State<UploadSummaryFab>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Transform.scale(scale: 1 + controller.value * .05, child: child);
      },
      child: Padding(
        padding:  EdgeInsets.only(bottom: context.h(2)),
        child: GestureDetector(
          onTap: widget.onTap,
          child: Container(
            height: context.h(5.5),
            padding: EdgeInsets.symmetric(horizontal: context.w(2.4)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color:AppColors.primaryColor ,
              boxShadow: [
                BoxShadow(
                  color: AppColors.baieg.withOpacity(.35),
                  blurRadius: 50,
                  spreadRadius: 2,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "رفع ملخص",
                  style: AppTextStyles.login3Style(context).copyWith(
                    color: AppColors.offWhite,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: context.w(2)),
                Icon(
                  Icons.upload_file_rounded,
                  color: AppColors.offWhite,
                  size: context.h(3),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
