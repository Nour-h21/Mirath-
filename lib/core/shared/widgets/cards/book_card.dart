import 'package:flutter/material.dart';
import 'package:mirath/core/design/tokens/colors.dart';
import 'package:mirath/core/utils/extensions/context_extensions.dart';

class BookCard extends StatelessWidget {
  final String title;
  final String image;
  final String? subtitle;
  final int? points;

  final Widget? trailing;
  final VoidCallback? onTap;

  const BookCard({
    super.key,
    required this.title,
    required this.image,
    this.subtitle,
    this.points,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(context.w(2)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),

          color: const Color.fromARGB(255, 237, 235, 229),

          border: Border(
            left: BorderSide(
              color: AppColors.primaryColor,
              width: context.w(1),
            ),
          ),

          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [AppColors.baieg.withOpacity(.8), AppColors.offWhite],
          ),

          boxShadow: const [
            BoxShadow(
              color: Color(0x20000000),
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),

        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// الصورة
            ClipRRect(
              borderRadius: BorderRadius.circular(context.w(3)),
              child: image.startsWith('http')
                  ? Image.network(
                      image,
                      width: context.w(22),
                      height: context.h(11),
                      fit: BoxFit.cover,
                    )
                  : Image.asset(
                      image,
                      width: context.w(22),
                      height: context.h(11),
                      fit: BoxFit.cover,
                    ),
            ),

            SizedBox(width: context.w(3)),

            /// المعلومات
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: context.h(1)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: context.sp(4),
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF2E2E2E),
                      ),
                    ),

                    if (subtitle != null) ...[
                      SizedBox(height: context.h(.5)),

                      Text(
                        subtitle!,
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: context.sp(2.8),
                        ),
                      ),
                    ],

                    if (points != null) ...[
                      SizedBox(height: context.h(1)),

                      Row(
                        children: [
                          const Icon(
                            Icons.star_border_outlined,
                            color: Color(0xFF8A2C48),
                            size: 16,
                          ),

                          SizedBox(width: context.w(1)),

                          Text(
                            "$points",
                            style: TextStyle(
                              color: const Color(0xFF8A2C48),
                              fontSize: context.sp(3),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
            ),

            if (trailing != null)
              Padding(
                padding: EdgeInsets.only(top: context.h(1.3)),
                child: trailing!,
              ),
          ],
        ),
      ),
    );
  }
}
