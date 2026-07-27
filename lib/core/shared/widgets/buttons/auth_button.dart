import 'package:flutter/material.dart';

import '../../../design/tokens/colors.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final double height;
  final double width;
  final TextStyle textStyle;
  const AuthButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.height,
    required this.width,
    required this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: AppColors.primaryColor,
          shadowColor: AppColors.deepPrimaryColor,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(24),
          ),
        ),
        child: Text(text, style: textStyle),
      ),
    );
  }
}
