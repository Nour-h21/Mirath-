import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mirath/core/constants/assets.dart';
import 'package:mirath/core/utils/extensions/context_extensions.dart';
import 'package:mirath/core/utils/extensions/widget_extensions.dart';

import '../../core/design/tokens/colors.dart';
import '../../core/design/tokens/typography.dart';

PageController controller = PageController();

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller,
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      children: [FirstPage(), SecondPage(), ThirdPage()],
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppAssets.onBoarding),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: context.h(40),
                  top: context.h(5),
                ),
                child: TextButton(
                  onPressed: () {
                    GoRouter.of(context).push('/NavicationBar');
                  },
                  child: Text(
                    'تخطي',
                    style: AppTextStyles.labelStyle(
                      context,
                    ).copyWith(fontSize: context.sp(4)),
                  ),
                ),
              ),
              SizedBox(height: context.h(19)),
              Image.asset(AppAssets.onBoarding1, height: context.h(28)),

              SizedBox(height: context.h(5)),
              Column(
                children: [
                  Text(
                    'العلم ميراثٌ يُتعلَّم',
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                    style: AppTextStyles.login1Style(
                      context,
                    ).copyWith(fontSize: context.sp(5.5)),
                  ),
                  SizedBox(height: context.h(1.8)),
                  Text(
                    "سر في خطةٍ تعليمية متدرجة, \nوتابع تقدّمك في رحلتك العلمية.",
                    style: AppTextStyles.login3Style(context).copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: context.sp(5),
                    ),
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                  ),
                ],
              ).paddingSymetricH(context, 6),
              SizedBox(height: context.h(4)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: context.h(0.90),
                    width: context.w(1.8),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  SizedBox(width: context.w(2)),
                  Container(
                    height: context.h(0.8),
                    width: context.w(1.6),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.greyWithPink,
                    ),
                  ),
                  SizedBox(width: context.w(2)),
                  Container(
                    height: context.h(0.8),
                    width: context.w(1.6),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.greyWithPink,
                    ),
                  ),
                ],
              ),
              SizedBox(height: context.h(4)),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: IconButton(
                      onPressed: () {
                        GoRouter.of(context).push('/SecondPage');
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: AppColors.primaryColor,
                        size: context.h(3.4),
                      ),
                    ),
                  ),
                ],
              ).paddingAll(context, 1),
            ],
          ),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppAssets.onBoarding),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: context.h(22)),
              Image.asset(AppAssets.onBoarding2, height: context.h(28)),

              SizedBox(height: context.h(6)),
              Column(
                children: [
                  Text(
                    'لأن لكل طالبٍ سؤال',
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                    style: AppTextStyles.login1Style(
                      context,
                    ).copyWith(fontSize: context.sp(5.5)),
                  ),
                  SizedBox(height: context.h(1.8)),
                  Text(
                    "يجيبك المساعد الذكي من محتوى الكتاب،\nليكون الفهم أقرب، والعلم أوضح.",
                    style: AppTextStyles.login3Style(context).copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: context.sp(4.8),
                    ),
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                  ),
                ],
              ).paddingSymetricH(context, 6),
              SizedBox(height: context.h(11.5)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: context.h(0.8),
                    width: context.w(1.6),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.greyWithPink,
                    ),
                  ),
                  SizedBox(width: context.w(2)),
                  Container(
                    height: context.h(0.90),
                    width: context.w(1.8),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  SizedBox(width: context.w(2)),
                  Container(
                    height: context.h(0.8),
                    width: context.w(1.6),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.greyWithPink,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: context.h(6),
                  right: context.h(1.1),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: IconButton(
                        onPressed: () {
                          GoRouter.of(context).push('/ThirdPage');
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: AppColors.primaryColor,
                          size: context.h(3.4),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppAssets.onBoarding),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: context.h(3)),
              Image.asset(AppAssets.onBoarding3, fit: BoxFit.fitWidth),

              SizedBox(height: context.h(5)),
              Column(
                children: [
                  Text(
                    'العلم يزكو بالمشاركة',
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                    style: AppTextStyles.login1Style(
                      context,
                    ).copyWith(fontSize: context.sp(5.5)),
                  ),
                  SizedBox(height: context.h(1.8)),
                  Text(
                    "تعلّم مع الآخرين عبر الجلسات الجماعية،\nوراجع محفوظك بأسلوب تفاعلي محفّز.",
                    style: AppTextStyles.login3Style(context).copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: context.sp(4.8),
                    ),
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                  ),
                ],
              ).paddingSymetricH(context, 6),
              SizedBox(height: context.h(5)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: context.h(0.8),
                    width: context.w(1.6),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.greyWithPink,
                    ),
                  ),
                  SizedBox(width: context.w(2)),
                  Container(
                    height: context.h(0.8),
                    width: context.w(1.6),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.greyWithPink,
                    ),
                  ),
                  SizedBox(width: context.w(2)),
                  Container(
                    height: context.h(0.90),
                    width: context.w(1.8),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ],
              ).paddingSymetricH(context, 10),
              SizedBox(height: context.h(3.2)),
              SizedBox(
                height: context.h(4.5),
                width: context.w(28),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    backgroundColor: AppColors.primaryColor,
                    shadowColor: AppColors.deepPrimaryColor,
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(20),
                    ),
                  ),

                  onPressed: () {
                    GoRouter.of(context).push('/NavicationBar');
                  },
                  child: Ink(
                    height: context.h(4.5),
                    width: context.w(28),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        colors: [AppColors.primaryColor, AppColors.offPink],
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "ابدأ رحلتك",
                        style: AppTextStyles.authbuttonStyle(
                          context,
                        ).copyWith(fontSize: context.sp(3.5)),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
