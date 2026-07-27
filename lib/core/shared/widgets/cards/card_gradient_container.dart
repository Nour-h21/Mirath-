import 'package:flutter/material.dart';

class CardGradientContainer extends StatelessWidget {
  const CardGradientContainer({
    super.key,
    required this.child,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.radius = 20,
    this.begin,
    this.end,
    this.color,
    this.boxShadow,
     this.gradient,
  }) ;

  final Widget child;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double radius;
  final AlignmentGeometry? begin; 
  final AlignmentGeometry? end; 
  final List<Color>? color;
  final List<BoxShadow>? boxShadow;
  final Gradient? gradient;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        
        borderRadius: BorderRadius.circular(radius),
        //  color: useGradient ? null : color,
        gradient: gradient ?? LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xFFF5EADA),
            Color(0xFFDADADA),
          ],
         ),
        boxShadow: boxShadow ?? [
          BoxShadow(
            color: Color(0x20000000),
            offset: Offset(0, 0),
            blurRadius: 2.5,
            spreadRadius: 2.5,
          ),
        ],
      ),
      child: child,
    );
  }
}
