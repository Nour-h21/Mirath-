import 'package:flutter/material.dart';
import 'package:mirath/core/utils/extensions/context_extensions.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../../../core/design/tokens/colors.dart';
import 'pdf_action_button.dart';

class PdfSearchBar extends StatelessWidget {
  final PdfTextSearchResult searchResult;
  final int currentSearchIndex;
  final VoidCallback onNext;
  final VoidCallback onPrevious;
  final VoidCallback onClose;

  const PdfSearchBar({
    super.key,
    required this.searchResult,
    required this.currentSearchIndex,
    required this.onNext,
    required this.onPrevious,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: context.w(4),
        vertical: context.h(.001),
      ),
      padding: EdgeInsets.symmetric(horizontal: context.w(2)),
      height: context.h(6),
      decoration: BoxDecoration(
        color: AppColors.transparent,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          PdfActionButton(
            onPressed: onPrevious,
            icon: Icons.keyboard_arrow_up_rounded,
          ),

          PdfActionButton(
            onPressed: onNext,
            icon: Icons.keyboard_arrow_down_rounded,
          ),
          SizedBox(width: context.w(52)),
          Expanded(
            child: IconButton(
              onPressed: onClose,
              icon: const Icon(Icons.close, color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}
