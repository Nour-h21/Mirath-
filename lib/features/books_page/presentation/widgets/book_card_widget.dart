import 'package:flutter/material.dart';
import 'package:mirath/core/utils/extensions/context_extensions.dart';
import 'package:mirath/core/utils/extensions/widget_extensions.dart';

import '../../../../core/design/tokens/colors.dart';
import '../../../../core/design/tokens/typography.dart';

class BookCard extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final VoidCallback onPressd;

  const BookCard({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.onPressd,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressd,
      child: Container(
        height: context.h(25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: AppColors.offWhite,
          boxShadow: const [BoxShadow(blurRadius: 7, color: Colors.grey)],
          image: DecorationImage(image: NetworkImage(image), fit: BoxFit.cover),
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: context.h(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: AppColors.black.withOpacity(0.55),
              ),
              child: ListTile(
                title: Text(
                  title,
                  style: AppTextStyles.authbuttonStyle(
                    context,
                  ).copyWith(fontSize: context.sp(3.2)),
                ),
                subtitle: Row(
                  children: [
                    Icon(
                      Icons.edit,
                      color: AppColors.primaryColor,
                      size: context.h(1.6),
                    ),

                    SizedBox(width: context.w(1)),
                    Expanded(
                      child: Text(
                        subtitle,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.authbuttonStyle(context).copyWith(
                          fontSize: context.sp(2.8),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ).paddingAll(context, 1.2),
    );
  }
}




// String getFullImageUrl(String imagePath) {
//   // إذا الرابط ناقص وبيرجع فقط المسار، ضيف رابط السيرفر
//   if (imagePath.startsWith('/')) {
//     return '${AppUrls.imageUrl}$imagePath';
//   }
//   // إذا الرابط localhost من الباك، عدله لعنوان الشبكة
//   if (imagePath.contains('localhost')) {
//     return imagePath.replaceFirst('localhost', AppUrls.localhost);
//   }
//   return imagePath;
// }