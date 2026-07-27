import 'package:flutter/material.dart';
import 'package:mirath/core/utils/extensions/context_extensions.dart';

import '../../../../core/design/tokens/colors.dart';
import '../../../../core/design/tokens/typography.dart';
import 'papre_folder_clipper.dart';

class ExtenalSummaryCard extends StatelessWidget {
  const ExtenalSummaryCard({
    super.key,
    required this.title,
    required this.chapterName,
    required this.createdAt,
    required this.onDelete,
    required this.onDetails,
  });

  final String title;
  final String chapterName;
  final String createdAt;

  final VoidCallback onDelete;
  final VoidCallback onDetails;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.h(27),
      child: Stack(
        children: [
          Container(
            height: context.h(27),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: LinearGradient(
                colors: [AppColors.grey, AppColors.offWhite],
              ),
            ),
          ),

          Positioned(
            top: context.h(5),
            right: context.w(9),
            child: SizedBox(
              width: context.w(160),
              height: context.h(20),
              child: Stack(
                children: [
                  _paper(angle: .28, right: context.h(0)),

                  _paper(angle: .08, right: context.h(3.5)),

                  _paper(angle: -.05, right: context.h(7.5)),
                ],
              ),
            ),
          ),

          Positioned(
            top: context.h(1.2),
            left: context.w(3.5),
            child: Container(
              width: context.w(10),
              height: context.h(5),
              decoration: BoxDecoration(
                shape: BoxShape.circle,

                gradient: LinearGradient(
                  colors: [AppColors.baieg, AppColors.offWhite],
                ),
              ),
              child: IconButton(
                onPressed: onDelete,
                icon: Icon(
                  Icons.delete,
                  color: AppColors.primaryColor,
                  size: context.h(2.6),
                ),
              ),
            ),
          ),

          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: ClipPath(
              clipper: FolderClipperRTL(),
              child: Container(
                height: context.h(17.8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: AppColors.baieg.withOpacity(0.6),
                ),
                padding: EdgeInsets.all(context.h(2)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_month,
                          size: context.h(2),
                          color: AppColors.primaryColor,
                        ),
                        SizedBox(width: context.w(1.5)),
                        Text(createdAt),
                      ],
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            title,
                            style: AppTextStyles.midDeepPrimaryColorStyle(
                              context,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Spacer(),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          chapterName,
                          style: AppTextStyles.smallBlack54Style(context),
                        ),
                        Directionality(
                          textDirection: TextDirection.ltr,
                          child: IconButton(
                            onPressed: onDetails,
                            icon: Icon(
                              Icons.arrow_back,
                              color: AppColors.primaryColor,
                              size: context.h(2.8),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _paper({required double angle, required double right}) {
    return Positioned(
      right: right,
      child: Transform.rotate(
        angle: angle,
        child: Container(
          width: 65,
          height: 85,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(.08), blurRadius: 10),
            ],
          ),
          child: Column(
            children: List.generate(
              6,
              (index) => Container(
                margin: const EdgeInsets.only(top: 8, left: 8, right: 8),
                height: 1,
                color: Colors.grey.shade300,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
