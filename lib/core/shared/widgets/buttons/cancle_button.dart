import 'package:flutter/material.dart';
import 'package:mirath/core/utils/extensions/context_extensions.dart';

import '../../../design/tokens/colors.dart';

class CancleButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final double height;
  final double width;
  final TextStyle textStyle;
  const CancleButton({
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
          backgroundColor: AppColors.offWhite,
          shadowColor: AppColors.deepPrimaryColor,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
            side: BorderSide(
              color: AppColors.primaryColor,
              width: context.w(.4),
            ),
          ),
        ),
        child: Text(text, style: textStyle),
      ),
    );
  }
}
