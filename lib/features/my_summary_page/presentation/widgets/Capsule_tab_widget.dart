import 'package:flutter/material.dart';
import 'package:mirath/core/utils/extensions/context_extensions.dart';

import '../../../../core/design/tokens/colors.dart';

class CapsuleTab extends StatelessWidget {
  final String label;

  const CapsuleTab({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Container(
        alignment: Alignment.center,
        width: context.w(60),
        height: context.h(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: AppColors.primaryColor, width: 1.5),
        ),
        child: Text(
          label,
          style:  TextStyle(fontSize:context.sp(4.2) , fontFamily: 'Arima',),
          textAlign: TextAlign.center,
        
        ),
      ),
    );
  }
}
