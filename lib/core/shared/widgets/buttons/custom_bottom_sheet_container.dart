import 'package:flutter/material.dart';
import 'package:mirath/core/design/tokens/colors.dart';
import 'package:mirath/core/utils/extensions/context_extensions.dart';

class CustomBottomSheetContainer extends StatelessWidget {
  final Widget child;
  final double? height;
  final EdgeInsetsGeometry? padding;

  const CustomBottomSheetContainer({
    super.key,
    required this.child,
    this.height,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: padding ?? EdgeInsets.all(context.w(5)),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: AppColors.primaryColor,
            width: context.w(1.3),
          ),
        ),

        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(context.w(8)),
          topRight: Radius.circular(context.w(8)),
        ),

        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.offWhite,
            AppColors.baieg.withOpacity(0.8),
          ],
        ),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.08),
            blurRadius: 8,
            spreadRadius: 1,
            offset: const Offset(0, -2),
          ),
        ],
      ),

      child: child,
    );
  }
}