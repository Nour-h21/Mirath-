import 'package:flutter/material.dart';
import 'package:mirath/core/utils/extensions/context_extensions.dart';
import 'package:mirath/core/utils/extensions/widget_extensions.dart';

import '../../../../core/design/tokens/colors.dart';
import '../../../../core/design/tokens/typography.dart';

class PdfHeader extends StatelessWidget {
  final String title;
  final VoidCallback onEdit;

  const PdfHeader({
    super.key,
    required this.title,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: AppTextStyles.midDeepPrimaryColorStyle(
              context,
            ).copyWith(
              fontSize: context.sp(4.2),
            ),
          ),
        ),
        IconButton(
          onPressed: onEdit,
          icon: const Icon(Icons.edit_document),
          iconSize: context.h(3.4),
          color: AppColors.primaryColor,
        ),
      ],
    ).paddingOnlyRight(context, 2);
  }
}