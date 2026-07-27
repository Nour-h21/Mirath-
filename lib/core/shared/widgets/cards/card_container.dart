import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {
  
  final Widget child;

  final double? width;
  final double? height;

  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  final double radius;

  final Color color;
  final double blurRadius;
  final double spreadRadius;

  const CardContainer({
    super.key,
    required this.child,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.radius = 25,
    this.color = const Color(0xffEDEBE5),
    this.blurRadius = 4,
    this.spreadRadius = 4,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius),
        boxShadow: [
          BoxShadow(
            color: Color(0x20000000),
            offset: Offset(0, 0),
            blurRadius: blurRadius,
            spreadRadius: spreadRadius,
          ),
        ],
      ),
      child: child,
    );
  }
}
