import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:mirath/core/utils/extensions/context_extensions.dart';

import '../../../../core/design/tokens/colors.dart';
import '../../../../core/design/tokens/typography.dart';


class DeleteSummaryDialog extends StatelessWidget {
  const DeleteSummaryDialog({
    super.key,
    required this.summaryId, required this.onDeleted,
    
  });

  final int summaryId;
  final VoidCallback onDeleted;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: AlertDialog(
        backgroundColor: AppColors.lightBaieg,
        title: Text(
          "حذف الملخص",
          style: AppTextStyles.midDeepPrimaryColorStyle(context),
        ),
        content: Text(
          "هل أنت متأكد من حذف هذا الملخص؟",
          style: AppTextStyles.smallBlack54Style(
            context,
          ).copyWith(fontSize: context.sp(4)),
        ),
        actions: [
          TextButton(
            onPressed: onDeleted,
            child: Text(
              "حذف",
              style: AppTextStyles.smallBlack54Style(
                context,
              ).copyWith(color: Colors.red, fontSize: context.sp(4.2)),
            ),
          ),
          TextButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            child: Text(
              "إلغاء",
              style: AppTextStyles.smallBlack54Style(
                context,
              ).copyWith(color: AppColors.black, fontSize: context.sp(4.2)),
            ),
          ),
        ],
      ),
    );
  }

  static Future<void> show({
    required BuildContext context,
    required int summaryId,
    required VoidCallback onDeleted,
  }) {
    return showDialog(
      context: context,
      barrierColor: AppColors.black.withOpacity(.15),
      builder: (_) =>
          DeleteSummaryDialog(summaryId: summaryId, onDeleted: onDeleted,),
    );
  }
}
