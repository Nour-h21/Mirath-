import 'dart:math';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mirath/core/design/tokens/colors.dart';
import 'package:mirath/core/design/tokens/typography.dart';
import 'package:mirath/core/shared/page/In_background_page.dart';
import 'package:mirath/core/shared/widgets/buttons/auth_button.dart';
import 'package:mirath/core/utils/extensions/context_extensions.dart';
import 'package:mirath/core/utils/extensions/widget_extensions.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../app/di/injection_container.dart';

class ChooseStudyWay extends StatefulWidget {
  final int chapterId;
  final String authorName;
  const ChooseStudyWay({
    super.key,
    required this.chapterId,
    required this.authorName,
  });

  @override
  State<ChooseStudyWay> createState() => _ChooseStudyWayState();
}

class _ChooseStudyWayState extends State<ChooseStudyWay> {
  final PageController _controller = PageController(viewportFraction: .78);

  double currentPage = 0;

  final List<_OptionModel> options = [
    _OptionModel(
      title: "دراسة الباب",
      subtitle: "PDF - فيديو - ملفات صوتية",
      icon: Icons.menu_book_rounded,
      colors: [
        AppColors.offWhite,
        AppColors.grey,
        AppColors.baieg,
        AppColors.offWhite,
      ],
      id: 1,
    ),
    _OptionModel(
      title: "الدراسة التحليلية",
      subtitle: "تابع تقدمك واكتشف نقاط القوة والضعف",
      icon: Icons.analytics_rounded,
      colors: [
        AppColors.offWhite,
        AppColors.grey,
        AppColors.baieg,
        AppColors.offWhite,
      ],
      id: 2,
    ),
    _OptionModel(
      title: "الاختبار المؤتمت",
      subtitle: "اختبر فهمك مع تصحيح فوري",
      icon: Icons.quiz_rounded,
      colors: [
        AppColors.offWhite,
        AppColors.grey,
        AppColors.baieg,
        AppColors.offWhite,
      ],
      id: 3,
    ),
  ];

  @override
  void initState() {
    super.initState();

    _controller.addListener(() {
      setState(() {
        currentPage = _controller.page ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: InBackgroundPage(
        labelAppBar: 'طريقة الدراسة',
        onBackPressed: () {
          final SharedPreferences prefs = getIt();
          final bookId = prefs.getInt("bookId");
          GoRouter.of(context).push('/OneBookPage', extra: bookId);
        },
        child: SizedBox(
          height: context.h(89),
          child: Column(
            children: [
              SizedBox(height: context.h(14)),

              Text(
                "اختر مسار التعلم الخاص بك",
                style: AppTextStyles.midDeepPrimaryColorStyle(context),
              ),

              const SizedBox(height: 10),

              Text(
                "يمكنك دراسة الباب أو إجراء الاختبار أو متابعة التحليل",
                textAlign: TextAlign.center,
                style: AppTextStyles.smallBlack54Style(context),
              ),

              Expanded(
                child: PageView.builder(
                  controller: _controller,
                  itemCount: options.length,
                  itemBuilder: (context, index) {
                    double diff = (currentPage - index).abs();
                    double scale = max(.85, 1 - (diff * .2));

                    return Transform.scale(
                      scale: scale,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32),
                          gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: options[index].colors,
                          ),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: diff < .5 ? 30 : 10,
                              spreadRadius: diff < .5 ? 3 : 0,
                              offset: const Offset(0, 12),
                              color: Colors.grey.withOpacity(0.5),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            TweenAnimationBuilder(
                              tween: Tween<double>(
                                begin: 0.8,
                                end: diff < .5 ? 1 : .8,
                              ),
                              duration: const Duration(milliseconds: 300),
                              builder: (_, value, child) {
                                return Transform.scale(
                                  scale: value,
                                  child: child,
                                );
                              },
                              child: Container(
                                height: context.h(22),
                                width: context.w(22),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(.18),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  options[index].icon,
                                  color: AppColors.primaryColor,
                                  size: context.h(7),
                                ),
                              ),
                            ),
                            Text(
                              options[index].title,
                              textAlign: TextAlign.center,
                              style: AppTextStyles.bigDeepPrimaryColorStyle(
                                context,
                              ).copyWith(fontSize: context.sp(6)),
                            ),
                            SizedBox(height: context.h(0.5)),
                            Text(
                              options[index].subtitle,
                              textAlign: TextAlign.center,
                              style: AppTextStyles.smallBlack54Style(context),
                            ),
                            SizedBox(height: context.h(6)),
                            AuthButton(
                              text: "ابدأ",
                              onPressed: () {
                                final SharedPreferences prefs = getIt();
                                prefs.setInt("chapterId", widget.chapterId);
                                prefs.setString(
                                  "authorName",
                                  widget.authorName,
                                );

                                if (options[index].id == 1) {
                                  GoRouter.of(context).push(
                                    '/SplitPdfAndSummaryPage',
                                    extra: PdfPageArgs(
                                      chapterId: widget.chapterId,
                                      authorName: widget.authorName,
                                    ),
                                  );
                                } else if (options[index].id == 2) {
                                  GoRouter.of(context).push(
                                    '/AnalyticalStudyPage',
                                    extra: widget.chapterId,
                                  );
                                } else {
                                  GoRouter.of(context).push(
                                    '/AutomatedQuizPage',
                                    extra: widget.chapterId,
                                  );
                                }
                              },
                              height: context.h(4.5),
                              width: context.w(38),
                              textStyle: AppTextStyles.authbuttonStyle(context),
                            ),
                          ],
                        ),
                      ).paddingSymetric(context, 10, 0.01),
                    );
                  },
                ),
              ),

              SizedBox(height: context.h(5)),
            ],
          ),
        ),
      ),
    );
  }
}

class _OptionModel {
  final String title;
  final String subtitle;
  final IconData icon;
  final List<Color> colors;
  final int id;

  _OptionModel({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.colors,
    required this.id,
  });
}

class PdfPageArgs {
  final int chapterId;

  final String authorName;

  PdfPageArgs({required this.chapterId, required this.authorName});
}
