import 'package:flutter/material.dart';

import 'package:mirath/core/design/tokens/colors.dart';

class CardGradientBorder extends StatelessWidget {
  const CardGradientBorder({
    super.key,
    required this.child,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.radius = 20,
    this.borderWidth = 8,
    this.borderColor,
    this.useGradient = false,
    this.color,
     this.boxShadow,
  }) ;

  final Widget child;

  final double? width;
  final double? height;

  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  final double radius;
  final double borderWidth;
  // final double blurRadius;
  // final double spreadRadius;

  final Color? borderColor;
  final bool useGradient;
  final Color? color;
  final List<BoxShadow>? boxShadow;
  

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: useGradient ? null : color,

gradient: useGradient
    ?  LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          AppColors.offWhite,
          Color(0xFFF5EADA),
        ],
      )
    : null,

        border: Border(
          left: BorderSide(
            color: borderColor ?? AppColors.primaryColor,
            width: borderWidth,
          ),
        ),

        boxShadow: [
          BoxShadow(
            color: const Color(0x20000000),
            offset: const Offset(0, 0),
            blurRadius: 2.5,
            spreadRadius: 2.5,
          ),
        ],
      ),
      child: child,
    );
  }
}
