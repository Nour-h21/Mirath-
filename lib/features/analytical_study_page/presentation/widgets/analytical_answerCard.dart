import 'package:flutter/material.dart';
import 'package:mirath/core/utils/extensions/context_extensions.dart';

import '../../../../core/design/tokens/typography.dart';

class AnalyticalAnswercard extends StatelessWidget {
  final String answer;

  const AnalyticalAnswercard({super.key, required this.answer});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(context.h(2)),
      decoration: BoxDecoration(
        color: Colors.green.shade50,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.green, width: 1.5),
        boxShadow: [
          BoxShadow(color: Colors.green.withOpacity(.08), blurRadius: 15),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.check_circle, color: Colors.green),
              SizedBox(width: context.w(2)),
              Text(
                "الإجابة",

                style: AppTextStyles.midDeepPrimaryColorStyle(context),
              ),
            ],
          ),
          SizedBox(height: context.h(1.5)),
          Text(
            answer,
            style: AppTextStyles.login3Style(context).copyWith(height: 1.7),
          ),
        ],
      ),
    );
  }
}
