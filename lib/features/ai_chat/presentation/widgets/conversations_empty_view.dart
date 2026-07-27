import 'package:flutter/material.dart';
import 'package:mirath/core/design/tokens/colors.dart';
import 'package:mirath/core/utils/extensions/context_extensions.dart';

class ConversationsEmptyView extends StatelessWidget {
  final VoidCallback onNewChat;

  const ConversationsEmptyView({
    super.key,
    required this.onNewChat,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.w(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: context.w(22),
              height: context.w(22),
              decoration: BoxDecoration(
                color: AppColors.baieg,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.forum_outlined,
                color: AppColors.primaryColor,
                size: context.sp(11),
              ),
            ),

            SizedBox(
              height: context.h(3),
            ),

            Text(
              'لا توجد محادثات بعد',
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: context.sp(5),
                fontWeight: FontWeight.w700,
              ),
            ),

            SizedBox(
              height: context.h(1.5),
            ),

            Text(
              'ابدأ محادثة جديدة مع مساعد ميراث للحصول على المساعدة والإجابات التي تحتاجها.',
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.black.withOpacity(0.55),
                fontSize: context.sp(3.3),
                height: 1.7,
              ),
            ),

            SizedBox(
              height: context.h(3),
            ),

            GestureDetector(
              onTap: onNewChat,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: context.w(5),
                  vertical: context.h(1.5),
                ),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(
                    context.w(3),
                  ),
                ),
                child: Text(
                  'ابدأ محادثة جديدة',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: context.sp(3.3),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}