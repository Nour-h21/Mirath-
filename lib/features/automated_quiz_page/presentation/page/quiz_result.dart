import 'package:mirath/features/automated_quiz_page/domain/entities/quiz_result_entity.dart';
import 'package:mirath/features/automated_quiz_page/presentation/widgets/quiz_result_form.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../app/di/injection_container.dart';
import '../../../../core/core.dart';
import '../../../../core/shared/widgets/buttons/auth_button.dart';
import '../../../../core/shared/widgets/buttons/cancle_button.dart';
import '../../../books_page/presentation/page/books_page.dart';
import '../../../chapter_details_page/presentation/page/choose_study_way.dart';

// final SharedPreferences prefs = getIt();
// final bookId = prefs.getInt("bookId");
// final classificationId = prefs.getInt("classifId");///this the setInt in home page

class MiddelQuizResult extends StatelessWidget {
  final QuizResultEntity result;

  const MiddelQuizResult({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    final SharedPreferences prefs = getIt();
    final bookId = prefs.getInt("bookId");
    final classificationId = prefs.getInt("classifId");

    ///this the setInt in home page
    return Directionality(
      textDirection: TextDirection.rtl,
      child: InBackgroundPage(
        labelAppBar: 'نتيجة الاختبار',
        onBackPressed: () {
          GoRouter.of(context).pushReplacement(
            '/OneBookPage',
            extra: BookDetailsArgs(
              classificationId: classificationId!,
              bookId: bookId!,
            ),
          );
        },
        child: SizedBox(
          height: context.h(100),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              QuizResultForm(
                image: AppAssets.success,
                title: 'تهانيناً !!',
                subTitle:
                    'لقد أتممت الاختبار بنجاح وأظهرت مستوى جيد من المعرفة والمهارات',
                quizResult: result.correctAnswers,
                percentResult: result.percentage,
                totalQuestion: result.totalQuestions,
              ),
              SizedBox(height: context.h(8)),
              AuthButton(
                text: "الباب التالي",
                width: context.w(60),
                height: context.h(6),
                onPressed: () async {
                  GoRouter.of(context).pushReplacement(
                    '/OneBookPage',
                    extra: BookDetailsArgs(
                      classificationId: classificationId!,
                      bookId: bookId!,
                    ),
                  );
                },
                textStyle: AppTextStyles.authbuttonStyle(context),
              ).paddingSymetricH(context, 18),
            ],
          ),
        ),
      ),
    );
  }
}

class HightQuizResult extends StatelessWidget {
  final QuizResultEntity result;
  const HightQuizResult({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    final SharedPreferences prefs = getIt();
    final bookId = prefs.getInt("bookId");
    final classificationId = prefs.getInt("classifId");

    return Directionality(
      textDirection: TextDirection.rtl,
      child: InBackgroundPage(
        labelAppBar: 'نتيجة الاختبار',
        onBackPressed: () {
          GoRouter.of(context).pushReplacement(
            '/OneBookPage',
            extra: BookDetailsArgs(
              classificationId: classificationId!,
              bookId: bookId!,
            ),
          );
        },
        child: SizedBox(
          height: context.h(100),
          child: ListView(
            children: [
              QuizResultForm(
                image: AppAssets.success,
                title: 'تهانيناً !!',
                subTitle:
                    'لقد أتممت الاختبار بنجاح باهر وأظهرت تميزاً معرفياً استثنائياً ',
                quizResult: result.correctAnswers,
                percentResult: result.percentage,
                totalQuestion: result.totalQuestions,
              ),
              SizedBox(height: context.h(8)),
              AuthButton(
                text: "الباب التالي",
                width: context.w(60),
                height: context.h(6),
                onPressed: () async {
                  GoRouter.of(context).pushReplacement(
                    '/OneBookPage',
                    extra: BookDetailsArgs(
                      classificationId: classificationId!,
                      bookId: bookId!,
                    ),
                  );
                  print("xxxxxxxxxxxxxxxxx:$bookId");
                },
                textStyle: AppTextStyles.authbuttonStyle(context),
              ).paddingSymetricH(context, 18),
            ],
          ),
        ),
      ),
    );
  }
}

class HightQuizResultWithPoint extends StatelessWidget {
  final QuizResultEntity result;

  const HightQuizResultWithPoint({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    final SharedPreferences prefs = getIt();
    final bookId = prefs.getInt("bookId");
    final classificationId = prefs.getInt("classifId");

    return Directionality(
      textDirection: TextDirection.rtl,
      child: InBackgroundPage(
        labelAppBar: 'نتيجة الاختبار',
        onBackPressed: () {
          GoRouter.of(context).pushReplacement(
            '/OneBookPage',
            extra: BookDetailsArgs(
              classificationId: classificationId!,
              bookId: bookId!,
            ),
          );
        },
        child: SizedBox(
          height: context.h(100),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              QuizResultForm(
                image: AppAssets.success,
                title: 'تهانيناً !!',
                subTitle:
                    'لقد أتممت الاختبار بنجاح باهر وأظهرت تميزاً معرفياً استثنائياً',
                quizResult: result.correctAnswers,
                percentResult: result.percentage,
                totalQuestion: result.totalQuestions,
              ),
              SizedBox(height: context.h(4)),
              Container(
                height: context.h(8.5),
                width: context.w(85),
                padding: EdgeInsets.all(context.h(1)),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      AppColors.baieg,
                      AppColors.primaryColor.withOpacity(0.12),
                      AppColors.grey,
                      AppColors.primaryColor.withOpacity(0.12),
                      AppColors.grey,
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.grey,
                      blurRadius: 5,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.card_giftcard,
                            color: AppColors.primaryColor,
                            size: context.h(4),
                          ),
                          Text(
                            '  مبروك لقد حصلت على (${result.newPoints}) نقاط',
                            style: AppTextStyles.smallBlack54Style(context)
                                .copyWith(
                                  color: AppColors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: context.h(0.5)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('🎊  ', style: TextStyle(fontSize: context.h(2))),

                        Text(
                          'مجموع نقاطك الحالي هو:  ${result.totalPoints}',
                          style: AppTextStyles.smallBlack54Style(context)
                              .copyWith(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ],
                    ),
                  ],
                ),
              ).paddingSymetricH(context, 10),
              SizedBox(height: context.h(3)),
              AuthButton(
                text: "الباب التالي",
                width: context.w(60),
                height: context.h(6),
                onPressed: () async {
                  // final bookId = prefs.getInt("bookId");

                  // await prefs.remove("bookId");
                  // await prefs.remove("classifId");
                  // final classificationId = prefs.getInt("classifId");

                  GoRouter.of(context).pushReplacement(
                    '/OneBookPage',
                    extra: BookDetailsArgs(
                      classificationId: classificationId!,
                      bookId: bookId!,
                    ),
                  );
                  Navigator.of(context).pop();
                },
                textStyle: AppTextStyles.authbuttonStyle(context),
              ).paddingSymetricH(context, 18),
            ],
          ),
        ),
      ),
    );
  }
}

class FailingQuizResult extends StatelessWidget {
  final QuizResultEntity result;

  const FailingQuizResult({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    final SharedPreferences prefs = getIt();
    final bookId = prefs.getInt("bookId");
    final classificationId = prefs.getInt("classifId");
    final chapterId = prefs.getInt("chapterId");
    final authorName = prefs.getString("authorName");
    return Directionality(
      textDirection: TextDirection.rtl,
      child: InBackgroundPage(
        labelAppBar: 'نتيجة الاختبار',
        onBackPressed: () {
          GoRouter.of(context).pop();
        },
        child: SizedBox(
          height: context.h(100),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              QuizResultForm(
                image: AppAssets.failing,
                title: 'لقد رسبت',
                subTitle:
                    'كل تحدٍ هو خطوة للتعلم ، تذكر أن العلم رحلة مستمرة وليست مجرد وجهة',
                quizResult: result.correctAnswers,
                percentResult: result.percentage,
                totalQuestion: result.totalQuestions,
              ),
              SizedBox(height: context.h(5)),
              Row(
                children: [
                  Expanded(
                    child: AuthButton(
                      text: "إعادة الاختبار",
                      width: context.w(50),
                      height: context.h(6),
                      onPressed: () {
                        GoRouter.of(context).pop();
                      },
                      textStyle: AppTextStyles.authbuttonStyle(context),
                    ),
                  ),

                  SizedBox(width: context.w(1.5)),
                  Expanded(
                    child: CancleButton(
                      text: "مراجعة الباب",
                      onPressed: () async {
                        // final chapterId = prefs.getInt("chapterId");
                        // final authorName = prefs.getString("authorName");
                        // final classificationId = prefs.getInt("classifId");

                        // ///this the setInt in home page

                        GoRouter.of(context).pushReplacement(
                          '/SplitPdfAndSummaryPage',
                          extra: PdfPageArgs(
                            bookId: bookId ?? 0,
                            chapterId: chapterId!,
                            authorName: authorName!,
                            classificationId: classificationId!,
                          ),
                        );
                      },
                      height: context.h(6),
                      width: context.w(50),
                      textStyle: AppTextStyles.login3Style(
                        context,
                      ).copyWith(color: AppColors.primaryColor),
                    ),
                  ),
                ],
              ).paddingAll(context, 2),
            ],
          ),
        ),
      ),
    );
  }
}
