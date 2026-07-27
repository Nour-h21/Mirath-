import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mirath/core/utils/extensions/context_extensions.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../../../core/design/tokens/colors.dart';
import '../../../../core/design/tokens/typography.dart';
import '../../../../core/shared/widgets/buttons/auth_button.dart';

class PdfSearchDialog {
  static Future<void> show({
    required BuildContext context,
    required PdfViewerController controller,
    required TextEditingController searchController,
    required Function(PdfTextSearchResult result) onSearchFinished,
  }) async {
    showDialog(
      barrierColor: AppColors.black.withOpacity(.12),
      context: context,
      builder: (_) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: AlertDialog(
            backgroundColor: AppColors.lightBaieg,
            title: Text(
              "بحث داخل الكتاب",
              style: AppTextStyles.midDeepPrimaryColorStyle(context),
            ),
            content: TextField(
              controller: searchController,
              cursorColor: AppColors.primaryColor,
              style: AppTextStyles.login3Style(context),
              decoration: InputDecoration(
                hintText: "ادخل كلمة البحث",
                hintStyle: AppTextStyles.smallBlack54Style(context),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.lightBlack),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primaryColor),
                ),
              ),
            ),
            actions: [
              AuthButton(
                text: "بحث",
                width: context.w(18),
                height: context.h(3.5),
                textStyle: AppTextStyles.authbuttonStyle(
                  context,
                ).copyWith(fontSize: context.sp(3.8)),
                onPressed: () async {
                  if (searchController.text.trim().isEmpty) {
                    return;
                  }
                  final result = await controller.searchText(
                    searchController.text,
                  );
                  
                  onSearchFinished(result);
                  if (context.mounted) {
                    GoRouter.of(context).pop();
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
