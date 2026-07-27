import 'package:flutter/material.dart';
import 'package:mirath/core/utils/extensions/context_extensions.dart';

import '../../../../core/design/tokens/typography.dart';


class QuizExplanationCard extends StatelessWidget {
  final String explanation;

  const QuizExplanationCard({
    super.key,
    required this.explanation,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(
        bottom: context.h(2),
      ),
      padding: EdgeInsets.all(
        context.h(2),
      ),
      decoration: BoxDecoration(
        color: Colors.amber.shade50,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.amber,
        ),
      ),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.lightbulb,
                color: Colors.amber.shade700,
              ),
              SizedBox(width: context.w(2)),
              Text(
                "توضيح",
                style:
                    AppTextStyles.midDeepPrimaryColorStyle(
                  context,
                ),
              ),
            ],
          ),

          SizedBox(height: context.h(1)),

          Text(
            explanation,
            style:
                AppTextStyles.smallBlack54Style(
              context,
            ),
          ),
        ],
      ),
    );
  }
}