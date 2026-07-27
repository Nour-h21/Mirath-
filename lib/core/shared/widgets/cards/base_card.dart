import 'package:flutter/material.dart';

import 'package:mirath/core/utils/extensions/context_extensions.dart';

import '../../../design/tokens/colors.dart';

class BaseCard extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? padding;
  final Gradient? gradient;
  final Color? borderColor;
  final double? width;
  final double? radius;

  const BaseCard({
    Key? key,
    required this.child,
    this.onTap,
    this.padding,
    this.gradient,
    this.borderColor,
    this.width,
    this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular( radius ?? context.w(8)),
      child: Container(
        width: width ?? context.w(90),
        padding: padding ??
            EdgeInsets.symmetric(
              horizontal: context.w(4),
              vertical: context.h(1.6),
            ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(context.w(8)),
          gradient: gradient,
          border: Border.all(
            color: borderColor ?? AppColors.primaryColor,
            width: 1.2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}
