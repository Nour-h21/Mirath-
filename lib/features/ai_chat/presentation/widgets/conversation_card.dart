import 'package:flutter/material.dart';

import '../../../../core/design/tokens/colors.dart';
import '../../../../core/utils/extensions/context_extensions.dart';

import '../../data/models/chat_model.dart';

class ConversationCard extends StatelessWidget {
  final ChatModel chat;

  final VoidCallback onTap;

  const ConversationCard({super.key, required this.chat, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: context.h(1.5)),
        padding: EdgeInsets.symmetric(
          horizontal: context.w(4),
          vertical: context.h(1.7),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(context.w(4)),
          border: Border.all(
            color: AppColors.grey.withOpacity(0.4),
            width: 0.7,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.025),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: context.w(12),
              height: context.w(12),
              decoration: BoxDecoration(
                color: AppColors.baieg,
                borderRadius: BorderRadius.circular(context.w(3)),
              ),
              child: Icon(
                Icons.chat_bubble_outline_rounded,
                color: AppColors.primaryColor,
                size: context.sp(5.5),
              ),
            ),

            SizedBox(width: context.w(3)),

            Expanded(
              child: Text(
                chat.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: context.sp(3.7),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),

            SizedBox(width: context.w(2)),

            Icon(
              Icons.arrow_back_ios_rounded,
              color: AppColors.primaryColor,
              size: context.sp(4),
            ),
          ],
        ),
      ),
    );
  }
}
