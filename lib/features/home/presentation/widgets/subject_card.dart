import 'package:flutter/material.dart';
import 'package:mirath/core/utils/extensions/context_extensions.dart';
import 'package:mirath/core/utils/extensions/widget_extensions.dart';

import '../../../../core/design/tokens/colors.dart';
import '../../../../core/design/tokens/typography.dart';

class SubjectCard extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  const SubjectCard({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: context.w(70),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: AppColors.offWhite,
          boxShadow: [BoxShadow(blurRadius: 7, color: Colors.grey)],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Column(
            children: [
              ClipPath(
                clipper: DiagonalClipper(),
                child: Container(
                  height: context.h(20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(image),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ),
      
              ListTile(
                title: Row(
                  children: [
                    Text(
                      title,
                      style: AppTextStyles.login3Style(context).copyWith(),
                    ),
                  ],
                ),
                subtitle: Text(
                  subtitle,
                  style: AppTextStyles.smallBlack54Style(
                    context,
                  ).copyWith(fontSize: context.sp(3.2)),
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Handle the tap event here
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.arrow_forward_rounded,
                      color: AppColors.primaryColor,
                      size: context.sp(5),
                    ),
                  ],
                ).paddingSymetricH(context, 3),
              ),
             
            ],
          ),
        ),
      ).paddingAll(context, 0.3),
    );
  }
}

class DiagonalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, size.height - 50);

    path.quadraticBezierTo(
      size.width * 0.25,
      size.height,
      size.width * 0.5,
      size.height - 30,
    );

    path.quadraticBezierTo(
      size.width * 0.75,
      size.height - 60,
      size.width,
      size.height - 20,
    );

    path.lineTo(size.width, 0);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
